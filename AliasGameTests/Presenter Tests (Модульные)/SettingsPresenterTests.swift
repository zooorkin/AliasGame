//
//  SettingsPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class SettingsPresenterTests: XCTestCase {

    var presenter: SettingsPresenter!
    
    var mockRouter: MockSettingsRouter!
    var stubInteractor: SettingsInteractorInput!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockSettingsRouter()
        stubInteractor = StubSettingsInteractor()
        presenter = SettingsPresenter(interactor: stubInteractor)
        presenter.router = mockRouter
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        stubInteractor = nil
        super.tearDown()
    }
    
    /// Метод exitTapped класса SettingsPresenter вызывает метод exitFromSettingsModule свойства router один раз
    func testSettingsPresenterExitTappedCallsRouterExitFromSettingsModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.exitTapped()
        // Assert
        mockRouter.verifyExitFromSettingsModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
