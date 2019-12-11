//
//  ReadyPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class ReadyPresenterTests: XCTestCase {

    var presenter: ReadyPresenter!
    
    var mockRouter: MockReadyRouter!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockReadyRouter()
        presenter = ReadyPresenter()
        presenter.router = mockRouter
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        super.tearDown()
    }
    
    /// Метод buttonTapped класса ReadyPresenter вызывает метод letsPlayFromReadyModule свойства router один раз
    func testReadyPresenterButtonTappedCallsRouterLetsPlayFromReadyModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.buttonTapped()
        // Assert
        mockRouter.verifyLetsPlayFromReadyModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
