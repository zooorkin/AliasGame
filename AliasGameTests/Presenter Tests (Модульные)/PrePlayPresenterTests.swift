//
//  PrePlayPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class PrePlayPresenterTests: XCTestCase {

    var presenter: PrePlayPresenter!
    
    var mockRouter: MockPrePlayRouter!
    var stubInteractor: StubPrePlayInteractor!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockPrePlayRouter()
        let configuration = AliasGameConfiguration(mode: .twoPlayers, numberOfRounds: 3, timeForSet: 60)
        stubInteractor = StubPrePlayInteractor(configuration: configuration)
        presenter = PrePlayPresenter(interactor: stubInteractor)
        presenter.router = mockRouter
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        stubInteractor = nil
        super.tearDown()
    }
    /// Метод exitTapped класса PrePlayPresenter вызывает метод exitFromPrePlayModule свойства router один раз
    func testPrePlayPresenterExitTappedCallsRouterExitFromPrePlayModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.viewDidLoad()
        presenter.exitTapped()
        // Assert
        mockRouter.verifyExitFromPrePlayModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод startGameButtonTapped класса PrePlayPresenter вызывает метод startGameFromPrePlayModule свойства router один раз
    func testPrePlayPresenterStartGameButtonTappedCallsRouterStartGameFromPrePlayModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.viewDidLoad()
        presenter.startGameButtonTapped()
        // Assert
        mockRouter.verifyStartGameFromPrePlayModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
