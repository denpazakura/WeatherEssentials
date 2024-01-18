//
//  TodayHeaderView.swift
//  WeatherEssentials
//
//  Created by denpazakura on 18/01/2024.
//

import SwiftUI

struct TodayHeaderView: View {
    let day: String
    let color: String
   // let forecast: DailyForecast
    
 // TODO: add response and implement
    var prevailingWeatherDescription: String? {
//        guard let firstForecastItem = forecast.forecastItems.values.first else {
//            return nil
//        }
//
//        guard let firstWeatherDetails = firstForecastItem.weather.first else {
//            return nil
//        }

   //     return firstWeatherDetails.main
        return "Rain"
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            // TODO implement when string extensions are ready Text("\(day.formattedDate().0) \(day.formattedDate().1)")
            Text("1 APR 2024")
                .modifier(TextModifier(style: .main))
                .padding(.top, 10)
            VStack {
                Text(prevailingWeatherDescription ?? "")
                    .modifier(TextModifier(style: .title))
                Spacer()
                Text("min: \(getMinMaxTemperature().0) °C")
                    .modifier(TextModifier(style: .main))
                Text("max: \(getMinMaxTemperature().1) °C")
                    .modifier(TextModifier(style: .main))
            }
            .padding(.horizontal)
            .frame(width: DesignConstants.standardElementWidth, alignment: .center)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                  //  ForEach(Array(forecast.forecastItems.values), id: \.id) { forecastItem in
                        //TODO: add TimeView
                  //  }
                }
                .padding(.leading, DesignConstants.smallPadding)
            }
            .frame(width: DesignConstants.standardElementWidth, alignment: .center)
            .padding(.bottom, DesignConstants.smallPadding)
            .padding(.top, DesignConstants.smallPadding)
        }
        .background(Color(color))
        .cornerRadius(15)
        .frame(alignment: .center)
    }
    
    private func getMinMaxTemperature() -> (minTemp: String, maxTemp: String) {
    //TODO: implement with actual data
//        let temperatures = forecast.forecastItems.values.compactMap { $0.main }
//        
//        let minTemp = temperatures.map { String(Int($0.tempMin)) }.min() ?? "no data"
//        let maxTemp = temperatures.map { String(Int($0.tempMax)) }.max() ?? "no data"
//        
//        return (minTemp, maxTemp)
        return ("6", "12")
    }
}

#Preview {
    TodayHeaderView(day: "", color: "10n")
}
