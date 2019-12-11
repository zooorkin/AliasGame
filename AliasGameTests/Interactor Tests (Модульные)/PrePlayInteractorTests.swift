//
//  PrePlayInteractorTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class PrePlayInteractorTests: XCTestCase {
    
    var interactor: PrePlayInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = PrePlayInteractor(mode: .twoPlayers)
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func testsPrePlayInteractorInitializedWithTwoTeamsHasConfigurationWithTwoTeams() {
        // Arrange
        interactor = nil
        let mode = AliasGameMode.twoTeams
        let expectedMode =  AliasGameMode.twoTeams
        // Act
        interactor = PrePlayInteractor(mode: mode)
        let realMode = interactor.configuration.mode
        // Assert
        XCTAssertEqual(expectedMode, realMode)
    }
    
    func testsPrePlayInteractorSetNumberOfRoundsOfSevenSetsSevenRounds() {
        // Arrange
        let expectedResult = 7
        // Act
        interactor.set(numberOfRounds: 7)
        // Assert
        XCTAssertEqual(interactor.numberOfRounds, expectedResult)
    }
    
    func testsPrePlayInteractorSetTimeForSetOfTenSetsTenTimeForSet() {
        // Arrange
        let expectedResult = 10
        // Act
        interactor.set(timeForSet: 10)
        // Assert
        XCTAssertEqual(interactor.timeForSet, expectedResult)
    }
    
}

