//
//  Rain.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

struct Rain: Codable {
    let threeHours: Double
    
    private enum CodingKeys: String, CodingKey {
        case threeHours = "3h"
    }
}
