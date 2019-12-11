//
//  SettingsInteractorTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class SettingsInteractorTests: XCTestCase {

    var interactor: SettingsInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = SettingsInteractor()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func testsSettingsInteractorInitsWithoutFatalError() {
        // Arrange
        let expectedReachedResult =  true
        // Act
        
        // Assert
        XCTAssert(expectedReachedResult)
    }

}
