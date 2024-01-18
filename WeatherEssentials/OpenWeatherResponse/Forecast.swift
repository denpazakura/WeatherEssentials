//
//  Forecast.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import Foundation

struct Forecast: Codable {
    var temp: Int
    var feelsLike: Int
    var tempMin: Int
    var tempMax: Int
    var pressure: Int
    var humidity: Int
    var tempKf: Int
    
    private enum CodingKeys: String, CodingKey {
        case temp,
             feelsLike = "feels_like",
             tempMin = "temp_min",
             tempMax = "temp_max",
             pressure,
             humidity,
             tempKf = "temp_kf"
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            temp = try Int(round(container.decode(Double.self, forKey: .temp)))
            feelsLike = try Int(round(container.decode(Double.self, forKey: .feelsLike)))
            tempMin = try Int(round(container.decode(Double.self, forKey: .tempMin)))
            tempMax = try Int(round(container.decode(Double.self, forKey: .tempMax)))
            pressure = try container.decode(Int.self, forKey: .pressure)
            humidity = try container.decode(Int.self, forKey: .humidity)
            tempKf = try Int(round(container.decode(Double.self, forKey: .tempKf)))
        }
}
