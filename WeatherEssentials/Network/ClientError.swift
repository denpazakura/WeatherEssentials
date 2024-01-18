//
//  ClientError.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//


import Foundation

enum ClientError: Error {
    case noConnection
    case badRequest
    case resourceNotFound
    case unauthorized
    case unexpected(_ code: Int)
}

extension ClientError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
           return NSLocalizedString("Check if the URL is correct", comment: "bad request")
        case .resourceNotFound:
            return NSLocalizedString("Resource not found", comment: "resource not found")
        case .unauthorized:
            return NSLocalizedString("You are not authorized to view this resource", comment: "unauthorized")
        case .unexpected(let code):
            return NSLocalizedString("An unexpected error occurred, code: \(code)", comment: "unexpected error")
        case .noConnection:
            return NSLocalizedString("No Internet connection", comment: "bad network")
        }
    }
}
