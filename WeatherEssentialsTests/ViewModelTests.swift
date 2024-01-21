//
//  ViewModelTests.swift
//  WeatherEssentialsTests
//
//  Created by denpazakura on 21/01/2024.
//

import XCTest
@testable import WeatherEssentials

@MainActor
final class ViewModelTests: XCTestCase {
    private var tested: ViewModel!
    private var client: MockAPIClient!
    
    override func setUp() async throws {
        client = MockAPIClient(testFileName: "stubbedforecastdata")
        tested = ViewModel(weatherAPIClient: client)
    }
    
    func testGetWeatherForecastSuccess() async {
        // Given
        client.result = .success
        
        let expectation = expectation(description: "expectation of success")
        
        Task {
            await tested.getWeatherForecast()
            
            // When
            expectation.fulfill()
            
            // Then
            XCTAssertEqual(tested.state, .loaded)
            XCTAssertNil(tested.errorMessage)
        }
        
        await fulfillment(of: [expectation], timeout: 10)
    }

    
    override func tearDown() async throws {
        client = nil
        tested = nil
    }
}

