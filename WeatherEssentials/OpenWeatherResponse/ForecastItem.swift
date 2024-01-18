//
//  ForecastItem.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

struct ForecastItem: Codable, Identifiable {
    let id = UUID()
    let dt: TimeInterval
    let main: Forecast?
    let weather: [Details]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: Rain?
    let dtTxt: String
    
    private enum CodingKeys: String, CodingKey {
        case dt,
             main,
             weather,
             clouds,
             wind,
             visibility,
             pop,
             rain,
             dtTxt = "dt_txt"
    }
}

