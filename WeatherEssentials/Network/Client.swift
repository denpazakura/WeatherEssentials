//
//  Client.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

protocol APIClient: AnyObject {
    var isNetworkAvailable: Bool { get set }
    func sendRequest<T: Decodable>() async throws -> T
    func makeRequest(method: String) throws -> URLRequest?
}

public enum Method: String {
    case get = "GET"
}

@available(macOS 12.0, *)
final class OWAPIClient: APIClient {
    var isNetworkAvailable: Bool = true
    private let cache: URLCache?
    
    private lazy var decoder: JSONDecoder = JSONDecoder()
    private lazy var errorMapper: ErrorMapper = ErrorMapper()
    private lazy var urlFactory: OpenWeatherURLFactory = OpenWeatherURLFactory(base: "stubbedforecastdata")
    
    init(cache: URLCache? = .shared) {
        self.cache = cache
    }
    
    func sendRequest<T: Decodable>() async throws -> T {
        let config = URLSessionConfiguration.default
        config.urlCache = cache
        config.requestCachePolicy = .returnCacheDataDontLoad
        
        if isNetworkAvailable {
            config.requestCachePolicy = .reloadIgnoringLocalCacheData
        }
        
        let session = URLSession(configuration: config)
        
        guard let request = try makeRequest(method: "GET") else {
            throw ClientError.badRequest
        }
        
        if !isNetworkAvailable && noCachedResponse(for: request) {
            throw ClientError.noConnection
        }
        
        do {
            let (data, response) = try await session.data(for: request)
            let mapped = try mapResponse(response: (data, response))
            
            guard let mappedResponse = mapped else {
                throw ClientError.badRequest
            }
            
            let fetchedData = try decoder.decode(T.self, from: mappedResponse)
            return fetchedData
            
        } catch let error {
            throw error
        }
    }
    
    
    private func noCachedResponse(for request: URLRequest) -> Bool {
        let cachedResponse = cache?.cachedResponse(for: request)
        return cachedResponse == nil || cachedResponse?.data == nil
    }
    
    private func mapResponse(response: (data: Data, response: URLResponse)) throws -> Data? {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return response.data
            
        }
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        default:
            return try errorMapper.mapErrorResponse(code: httpResponse.statusCode)
        }
    }
}

@available(macOS 12.0, *)
@available(iOS 15.0, *)
extension OWAPIClient {
    func makeRequest(method: String) throws -> URLRequest? {
        return urlFactory.forecastRequest(method: method)
    }
}
