//
//  RecordsPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class RecordsPresenterTests: XCTestCase {

    var presenter: RecordsPresenter!
    
    var mockRouter: MockRecordsRouter!
    var stubInteractor: RecordsInteractorInput!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockRecordsRouter()
        stubInteractor = StubRecordsInteractor()
        presenter = RecordsPresenter(interactor: stubInteractor)
        presenter.router = mockRouter
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        stubInteractor = nil
        super.tearDown()
    }
    
    /// Метод exitTapped класса RecordsPresenter вызывает метод exitFromRecordsModule свойства router один раз
    func testRecordsPresenterExitTappedCallsRouterExitFromRecordsModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.exitTapped()
        // Assert
        mockRouter.verifyExitFromRecordsModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
