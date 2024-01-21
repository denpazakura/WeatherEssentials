//
//  URLFactory.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

class OpenWeatherURLFactory {
    private let base: String
    
    init(base: String) {
        self.base = base
    }
    
    func forecastRequest(method: String) -> URLRequest? {
        
        guard let baseURL = URL(string: base) else { return nil }
        
        let endpoint = "/data/2.5/forecast"
        let queryParams = [
            "q": "Paris, FR",
            "units": "metric",
        ]
        
        let fullURL = baseURL.appendingPathComponent(endpoint)
        
        guard var urlComponents = URLComponents(url: fullURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
    
    func iconURL(icon: String) -> URL? {
        guard let baseURL = URL(string: base) else { return nil }
        let endpoint = "/img/wn/" + icon
        
        return baseURL.appendingPathComponent(endpoint)
    }
}
