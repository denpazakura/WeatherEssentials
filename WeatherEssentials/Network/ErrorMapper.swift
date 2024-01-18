//
//  ErrorMapper.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

struct ErrorMapper {
    func mapErrorResponse(code: Int) throws -> Data {
        switch code {
        case 400:
            throw ClientError.badRequest
        case 401:
            throw ClientError.unauthorized
        case 404:
            throw ClientError.resourceNotFound
        default:
            throw ClientError.unexpected(code)
        }
    }
}
