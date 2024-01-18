//
//  Details.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

struct Details: Codable {
    let id: Int
    let main: String
    let readableDescription: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case id,
             main,
             readableDescription = "description",
             icon
    }
}
