//
//  StringExtensionsTests.swift
//  WeatherEssentialsTests
//
//  Created by denpazakura on 21/01/2024.
//

import XCTest
@testable import WeatherEssentials

final class StringExtensionTests: XCTestCase {
    func testFormattedDateValidString() {
        // Given
        let sut = "2022-02-24"
        
        // Then
        XCTAssertTrue(sut.formattedDate() == ("24 Feb", "2022"))
    }
    
    func testFormattedDateInvalidString() {
        // Given
        let sut = "random string"
        
        // Then
        XCTAssertTrue(sut.formattedDate() == ("random string", ""))
    }
}
