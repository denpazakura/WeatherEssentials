//
//  StringExtensions.swift
//  WeatherEssentials
//
//  Created by denpazakura on 19/01/2024.
//

import Foundation

extension String {
    func formattedDate() -> (String, String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: self) else {
            return (self, "")
        }

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd MMM"

        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy"

        let dayString = dayFormatter.string(from: date)
        let yearString = yearFormatter.string(from: date)

        return (dayString, yearString)
    }

    func formattedTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let date = dateFormatter.date(from: self) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"

            let timeString = timeFormatter.string(from: date)
            return timeString
        } else {
            return self
        }
    }
}
