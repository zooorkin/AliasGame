//
//  ArrayHelperTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class ArrayHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testArrayExtensionUniqueElementsTransforms_AAB_To_AB() {
        // Arrange
        let original = ["A", "A", "B"]
        let expected = ["A", "B"]
        // Act
        let real = original.uniqueElements()
        // Assert
        XCTAssertEqual(real, expected)
    }
    
    func testArrayExtensionUniqueElementsTransforms_ABC_To_ABC() {
        // Arrange
        let original = ["A", "B", "C"]
        let expected = ["A", "B", "C"]
        // Act
        let real = original.uniqueElements()
        // Assert
        XCTAssertEqual(real, expected)
    }
    
    func testArrayExtensionUniqueElementsTransforms_AAA_To_A() {
        // Arrange
        let original = ["A", "A", "A"]
        let expected = ["A"]
        // Act
        let real = original.uniqueElements()
        // Assert
        XCTAssertEqual(real, expected)
    }
    
}
