//
//  ResultPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class ResultPresenterTests: XCTestCase {

    var presenter: ResultPresenter!
    
    var mockRouter: MockResultRouter!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockResultRouter()
        presenter = ResultPresenter(title: "", emoji: "", text: "", buttonTitle: ""){
            self.mockRouter.exitFromResultModule()
        }
        presenter.router = mockRouter
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        super.tearDown()
    }
    
    /// Метод buttonTapped класса ResultPresenter вызывает метод exitFromResultModule свойства router один раз
    func testResultPresenterButtonTappedCallsRouterExitFromResultModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.viewDidLoad()
        presenter.buttonTapped()
        // Assert
        mockRouter.verifyExitFromResultModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
