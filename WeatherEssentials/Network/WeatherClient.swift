//
//  WeatherClient.swift
//  WeatherEssentials
//
//  Created by denpazakura on 21/01/2024.
//

import Foundation
import WeatherKit

@available(macOS 12.0, *)
final class WeatherClient: APIClient {
    var isNetworkAvailable: Bool = true
    private let cache: URLCache?
    
    private lazy var decoder: JSONDecoder = JSONDecoder()
    private lazy var errorMapper: ErrorMapper = ErrorMapper()
    
    init(cache: URLCache? = .shared) {
        self.cache = cache
    }
    
    func sendRequest<T: Decodable>() async throws -> T? {
    // TODO: implement
//        let config = URLSessionConfiguration.default
//        config.urlCache = cache
//        config.requestCachePolicy = .returnCacheDataDontLoad
//        
//        if isNetworkAvailable {
//            config.requestCachePolicy = .reloadIgnoringLocalCacheData
//        }
//        
//        let session = URLSession(configuration: config)
        
        return nil
    }
    
}

@available(macOS 12.0, *)
@available(iOS 15.0, *)
extension WeatherClient {
    func makeRequest(method: String) throws -> URLRequest? {
        return nil
    }
}


private extension WeatherClient {
    func noCachedResponse(for request: URLRequest) -> Bool {
        let cachedResponse = cache?.cachedResponse(for: request)
        return cachedResponse == nil || cachedResponse?.data == nil
    }
    
    func mapResponse(response: (data: Data, response: URLResponse)) throws -> Data? {
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
