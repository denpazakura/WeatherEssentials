//
//  NextDaysForecastView.swift
//  WeatherEssentials
//
//  Created by denpazakura on 19/01/2024.
//

import SwiftUI

struct NextDaysForecastView: View {
    let day: String
    let forecastItems: [String: ForecastItem]
    
    var prevailingWeatherDescription: String? {
        guard let firstForecastItem = forecastItems.values.first else {
            return nil
        }
        guard let firstWeatherDetails = firstForecastItem.weather.first else {
            return nil
        }
        
        return firstWeatherDetails.main
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(day.formattedDate().0) 
                    .modifier(TextModifier(style: .date))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: DesignConstants.standardPadding)
                Divider()
                    .background(DesignConstants.primaryFontColor)
                    .padding(.leading, 10)
                Text(prevailingWeatherDescription ?? "no data")
                    .modifier(TextModifier(style: .main))
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: DesignConstants.standardPadding)
            }
            Divider().background(Color.black).frame(height: 150, alignment: .center)
            
            if let (minTemp, maxTemp) = getMinMaxTemperature() {
                VStack(alignment: .leading) {
                    Text("min: \(Int(minTemp))°C")
                        .modifier(TextModifier(style: .main))
                    Text("max: \(Int(maxTemp))°C")
                        .modifier(TextModifier(style: .main))
                }
                .padding(.trailing, DesignConstants.standardPadding)
            }
    }
        .frame(width: DesignConstants.standardElementWidth)
        .background(DesignConstants.mainElementBackground)
        .cornerRadius(DesignConstants.cornerRadius)
    }
    
    private func getMinMaxTemperature() -> (minTemp: Int, maxTemp: Int)? {
        let temperatures = forecastItems.values.compactMap { $0.main }
        
        let minTemp = temperatures.map { Int($0.tempMin) }.min() ?? 0
        let maxTemp = temperatures.map { Int($0.tempMax) }.max() ?? 0
        
        return (minTemp, maxTemp)
    }
}

#Preview {
    NextDaysForecastView(day: "19 Jan 2024", forecastItems: ["02 Jan 2024" : ForecastItem(dt: 1704650400.0, main: nil, weather: [
        Details(id: 804, main: "Clouds", readableDescription: "overcast clouds", icon: "04n")],
                        clouds: Clouds(all: 100),
                        wind: Wind(speed: 4.85),
                        visibility: 10000,
                        pop: 0.0,
                        rain: nil,
                        dtTxt: "2024-01-07 18:00:00")])
}
