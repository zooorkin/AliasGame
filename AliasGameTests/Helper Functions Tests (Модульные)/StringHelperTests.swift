//
//  StringHelperTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class StringHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    /// Extension uppercasedFirstLetter к классу String переводит "тесты" в "Тесты"
    func testStringExtensionUppercasedFirstLetterTransforms_tests_to_Tests() {
        // Arrange
        let original = "тесты"
        let expected = "Тесты"
        // Act
        let real = original.uppercasedFirstLetter()
        // Assert
        XCTAssertEqual(real, expected)
    }
    
    /// Extension uppercasedFirstLetter к классу String переводит "iPhone" в "Iphone"
    func testStringExtensionUppercasedFirstLetterTransforms_iPhone_to_Iphone() {
        // Arrange
        let original = "iPhone"
        let expected = "Iphone"
        // Act
        let real = original.uppercasedFirstLetter()
        // Assert
        XCTAssertEqual(real, expected)
    }

}
