//
//  ViewModel.swift
//  WeatherEssentials
//
//  Created by denpazakura on 21/01/2024.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    enum State {
        case progress,
             loaded,
             error
    }
    
    private let weatherAPIClient: APIClient
    
    @Published var errorMessage: String?
    @Published var state: State = .progress
    
    var networkMonitor: NetworkMonitor = NetworkMonitor()
    
    init(weatherAPIClient: APIClient) {
        self.weatherAPIClient = weatherAPIClient
    }
    
    @MainActor
    func getWeatherForecast() async {
        weatherAPIClient.isNetworkAvailable = networkMonitor.isActive
        state = .progress
        try? await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            Task {
                do {
                   print("fetching weather...")
                    state = .loaded
                    
                    continuation.resume()
                    
                } catch let error {
                    state = .error
                    errorMessage = error.localizedDescription
                    
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
