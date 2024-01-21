//
//  NetworkMonitor.swift
//  WeatherEssentials
//
//  Created by denpazakura on 21/01/2024.
//

import Network
import Combine

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    var isActive = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.isActive = path.status == .satisfied

            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }

        monitor.start(queue: queue)
    }
}
