//
//  TeamResultPresenterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

class TeamResultPresenterTests: XCTestCase {

    var presenter: TeamResultPresenter!
    
    var mockRouter: MockTeamResultRouter!
    
    override func setUp() {
        super.setUp()
        mockRouter = MockTeamResultRouter()
        let configuration = AliasGameConfiguration(mode: .twoPlayers, numberOfRounds: 3, timeForSet: 60)
        let teamResult = TeamResult(configuration: configuration, score: 0, team: 0)
        presenter = TeamResultPresenter(configuration: configuration, teamResult: teamResult, completion: {
            self.mockRouter.exitFromTeamResultModule()
        })
        presenter.router = mockRouter
    }
    
    override func tearDown() {
        presenter = nil
        mockRouter = nil
        super.tearDown()
    }
    
    /// Метод buttonTapped класса TeamResultPresenter вызывает метод exitFromTeamResultModule свойства router один раз
    func testTeamResultPresenterButtonTappedCallsRouterExitFromTeamResultModuleOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        presenter.viewDidLoad()
        presenter.buttonTapped()
        // Assert
        mockRouter.verifyExitFromTeamResultModuleCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }

}
