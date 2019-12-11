//
//  RecordsInteractorTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class RecordsInteractorTests: XCTestCase {

    var interactor: RecordsInteractor!
    
    var mockGameDataProvider: GameDataProviderProtocol!
    
    override func setUp() {
        super.setUp()
        mockGameDataProvider = MockGameDataProvider()
        interactor = RecordsInteractor(gameDataProvider: mockGameDataProvider)
    }
    
    override func tearDown() {
        interactor = nil
        mockGameDataProvider = nil
        super.tearDown()
    }
    
    func testsRecordsInteractorInitsWithoutFatalError() {
        // Arrange
        let expectedReachedResult =  true
        // Act
        
        // Assert
        XCTAssert(expectedReachedResult)
    }

}
