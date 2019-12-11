//
//  StartPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class StartPresenterTests: XCTestCase {
    
    var presenter: StartPresenter!
    
    var mockRouter: MockStartRouter!
    var mockInteractor: StartInteractorInput!

    override func setUp() {
        super.setUp()
        mockRouter = MockStartRouter()
        mockInteractor = MockStartInteractor()
        presenter = StartPresenter(interactor: mockInteractor)
        presenter.router = mockRouter
    }

    override func tearDown() {
        presenter = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    /// Метод gameModeTapped класса StartPresenter вызывает метод play свойства router один раз
    func testStartPresenterGameModeTappedCallsRouterPlayOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.gameModeTapped(withMode: .twoPlayers)
        // Assert
        mockRouter.verifyPlayCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод recordsButtonTapped класса StartPresenter вызывает метод records свойства router один раз
    func testStartPresenterRecordsButtonTappedCallsRouterRecordsOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.recordsButtonTapped()
        // Assert
        mockRouter.verifyRecordsCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод settingsButtonTapped класса StartPresenter вызывает метод settings свойства router один раз
    func testStartPresenterSettingsButtonTappedCallsRouterSettingsOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.settingsButtonTapped()
        // Assert
        mockRouter.verifySettingsCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод aboutGameButtonTapped класса StartPresenter вызывает метод aboutGame свойства router один раз
    func testStartPresenterAboutGameButtonTappedCallsRouterAboutGameOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.aboutGameButtonTapped()
        // Assert
        mockRouter.verifyAboutGameCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
