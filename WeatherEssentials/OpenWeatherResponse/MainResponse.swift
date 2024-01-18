//
//  MainResponse.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

struct MainResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [ForecastItem]
    let city: City
}
