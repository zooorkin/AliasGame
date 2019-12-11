//
//  AboutInteractorTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class AboutInteractorTests: XCTestCase {

    var interactor: AboutInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = AboutInteractor()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func testsAboutInteractorInitsWithoutFatalError() {
        // Arrange
        let expectedReachedResult =  true
        // Act
        
        // Assert
        XCTAssert(expectedReachedResult)
    }

}
