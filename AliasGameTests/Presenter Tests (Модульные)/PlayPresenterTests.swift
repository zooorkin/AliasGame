//
//  PlayPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class PlayPresenterTests: XCTestCase {

    var presenter: PlayPresenter!
    
    var mockRouter: MockPlayRouter!
    var mockInteractor: MockPlayInteractor!
    var mockOutput: MockPlayPresenterOutput!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockPlayRouter()
        mockInteractor = MockPlayInteractor()
        presenter = PlayPresenter(interactor: mockInteractor)
        mockOutput = MockPlayPresenterOutput()
        
        presenter.router = mockRouter
        presenter.output = mockOutput
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    /// Метод exitTapped класса PlayPresenter вызывает метод exitFromPlayModule свойства router один раз
    func testPlayPresenterExitTappedCallsRouterExitFromPlayModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.exitTapped()
        // Assert
        mockRouter.verifyExitFromPlayModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод pauseButtonTapped класса Play вызывает метод stopTimer свойства interactor один раз
    func testPlayPauseButtonTappedCallsInteractorStopTimerOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.pauseButtonTapped()
        // Assert
        mockInteractor.verifyStopTimerCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод exitTapped класса Play вызывает метод stopTimer свойства interactor один раз
    func testPlayExitTappedCallsInteractorStopTimerOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.exitTapped()
        // Assert
        mockInteractor.verifyStopTimerCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод pauseButtonTapped класса Play вызывает метод showAlert свойства output один раз
    func testPlayPauseButtonTappedCallsOutputShowAlertOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.pauseButtonTapped()
        // Assert
        mockOutput.verifyShowAlertCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод exitTapped класса Play вызывает метод showAlert свойства output один раз
    func testPlayExitTappedCallsOutputShowAlertOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.exitTapped()
        // Assert
        mockOutput.verifyShowAlertCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод successButtonTapped класса Play вызывает метод setScore свойства output один раз
    func testPlaySuccessButtonTappedCallsOutputSetScoreOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.successButtonTapped()
        // Assert
        mockOutput.verifySetScoreCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод successButtonTapped класса Play вызывает метод setCurrentWord свойства output один раз
    func testPlaySuccessButtonTappedCallsOutputSetCurrentWordOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.successButtonTapped()
        // Assert
        mockOutput.verifySetCurrentWordCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод successButtonTapped класса Play вызывает метод performSlide свойства output один раз
    func testPlaySuccessButtonTappedCallsOutputPerformSlideOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.successButtonTapped()
        // Assert
        mockOutput.verifyPerformSlideCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод failureButtonTapped класса Play вызывает метод setScore свойства output один раз
    func testPlayFailureButtonTappedCallsOutputSetScoreOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.failureButtonTapped()
        // Assert
        mockOutput.verifySetScoreCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод failureButtonTapped класса Play вызывает метод setCurrentWord свойства output один раз
    func testPlayFailureButtonTappedCallsOutputSetCurrentWordOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.failureButtonTapped()
        // Assert
        mockOutput.verifySetCurrentWordCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод failureButtonTapped класса Play вызывает метод performSlide свойства output один раз
    func testPlayFailureButtonTappedCallsOutputPerformSlideOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.failureButtonTapped()
        // Assert
        mockOutput.verifyPerformSlideCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
