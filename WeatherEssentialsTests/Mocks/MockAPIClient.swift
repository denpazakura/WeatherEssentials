//
//  MockAPIClient.swift
//  WeatherEssentialsTests
//
//  Created by denpazakura on 21/01/2024.
//

import Foundation
@testable import WeatherEssentials

final class MockAPIClient: APIClient {
    var isNetworkAvailable: Bool = true
    
    enum DummyResult {
        case success,
             failure
    }
    
    private let testFileName: String
    var result: DummyResult = .success
    
    init(testFileName: String) {
        self.testFileName = testFileName
    }
    
    func sendRequest<T: Decodable>() async throws -> T {
        switch self.result {
        case .success:
            let bundle = Bundle(for: type(of: self))
            guard let url = bundle.url(forResource: "stubbedforecastdata", withExtension: "json") else {
                throw ClientError.resourceNotFound
            }
            
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
            
        case .failure:
            throw ClientError.badRequest
        }
    }
    
    func makeRequest(method: String) throws -> URLRequest? {
        return nil
    }
    
    func iconURL(icon: String) -> URL? {
        return nil
    }
}
