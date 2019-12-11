//
//  AboutPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class AboutPresenterTests: XCTestCase {

    var presenter: AboutPresenter!
    
    var mockRouter: MockAboutRouter!
    var mockOutput: MockAboutPresenterOutput!
    var stubInteractor: StubAboutInteractor!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockAboutRouter()
        mockOutput = MockAboutPresenterOutput()
        stubInteractor = StubAboutInteractor()
        presenter = AboutPresenter(interactor: stubInteractor)
        presenter.router = mockRouter
        presenter.output = mockOutput
    }
    
    override func tearDown() {
        presenter = nil
        mockOutput = nil
        mockRouter = nil
        stubInteractor = nil
        super.tearDown()
    }
    
    /// Метод viewDidLoad класса About вызывает метод setTitle свойства output один раз
    func testAboutViewDidLoadCallsOutputSetTitleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.viewDidLoad()
        // Assert
        mockOutput.verifySetTitleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод viewDidLoad класса About вызывает метод setText свойства output один раз
    func testAboutViewDidLoadCallsOutputSetTextOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.viewDidLoad()
        // Assert
        mockOutput.verifySetTextCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
}
