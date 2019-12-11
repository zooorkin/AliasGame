//
//  StartInteractorTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class StartInteractorTests: XCTestCase {
    
    var interactor: StartInteractor!

    override func setUp() {
        super.setUp()
        interactor = StartInteractor()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func testsStartInteractorInitsWithoutFatalError() {
        // Arrange
        let expectedReachedResult =  true
        // Act
        
        // Assert
        XCTAssert(expectedReachedResult)
    }

}
