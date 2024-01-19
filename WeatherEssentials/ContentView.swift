//
//  ContentView.swift
//  WeatherEssentials
//
//  Created by denpazakura on 17/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            ScrollView {
               content()
                .onAppear {
                   
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(DesignConstants.mainBackground)
        }
    }
    
    @ViewBuilder
    private func content() -> some View {
        forecast()
        }
    
    
   @ViewBuilder
    private func forecast() -> some View {
        LazyVStack(alignment: .center, spacing: 10) {
            TodayHeaderView(day: "20 Apr 2024", color: "01d")
            
                NavigationLink {
                    
                } label: {
                    NextDaysForecastView(day: "20 Apr 2024", forecastItems: stubbedDataForPreview())
                        .padding(.bottom, 10)
                        .frame(width: DesignConstants.standardElementWidth, alignment: .center)
                }
            }
        }
    }

#Preview {
    ContentView()
}

private extension ContentView {
    func stubbedDataForPreview() -> [String: ForecastItem] {
        return ["" : ForecastItem(dt: 1704650400.0, main: nil, weather: [
            Details(id: 804, main: "Clouds", readableDescription: "overcast clouds", icon: "01d")],
                            clouds: Clouds(all: 100),
                            wind: Wind(speed: 4.85),
                            visibility: 10000,
                            pop: 0.0,
                            rain: nil,
                                  dtTxt: "2024-01-07 18:00:00")]
    }
}
