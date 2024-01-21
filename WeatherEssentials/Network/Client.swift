//
//  Client.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

protocol APIClient: AnyObject {
    var isNetworkAvailable: Bool { get set }
    func sendRequest<T: Decodable>() async throws -> T?
    func makeRequest(method: String) throws -> URLRequest?
}

public enum Method: String {
    case get = "GET"
}
