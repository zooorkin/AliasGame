//
//  PlayInteractorTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class PlayInteractorTests: XCTestCase {

    var interactor: PlayInteractor!
    
    var output: MockPlayInteractorOutput!
    
    var mockWordsProvider: MockWordsProvider!
    var imageProvider: ImageProviderProtocol!
    var translater: TranslaterProtocol!
    var imageClassificator: ImageClassificatorProtocol!
    var gameDataSaver: GameDataSaverProtocol!
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.set(1, forKey: "wordList")
        mockWordsProvider = MockWordsProvider()
        imageProvider = MockImageProvider()
        translater = MockTranslater()
        imageClassificator = MockImageClassificator()
        gameDataSaver = MockGameDataSaver()
        output = MockPlayInteractorOutput()
        
        interactor = PlayInteractor(configuration: AliasGameConfiguration.default,
                                    wordsProvider: mockWordsProvider,
                                    imageProvider: imageProvider, translater: translater, imageClassificator: imageClassificator, gameDataSaver: gameDataSaver)
        interactor.output = output
        mockWordsProvider.delegate = interactor
        imageProvider.delegate = interactor
        imageClassificator.delegate = interactor
        gameDataSaver.delegate = interactor
    }
    
    override func tearDown() {
        interactor = nil
        
        mockWordsProvider = nil
        imageProvider = nil
        translater = nil
        imageClassificator = nil
        gameDataSaver = nil
        UserDefaults.standard.set(nil, forKey: "wordList")
        super.tearDown()
    }
    
    func testsPlayInteractorWithTeamTwoAndRoundThreeCallNextRoundSetsTeamZeroAndRoundFour() {
        // Arrange
        interactor.team = 2
        interactor.round = 3
        let expectedResult = [0, 4]
        // Act
        interactor.nextRound()
        let realResult = [interactor.team, interactor.round]
        // Assert
        XCTAssertEqual(realResult, expectedResult)
    }
    
    func testsPlayInteractorWithTeamZeroCallNextTeamSetsTeamOne() {
        // Arrange
        let score = 0
        interactor.team = 0
        let expectedResult = 1
        // Act
        interactor.nextTeam(withSaving: score)
        let realResult = interactor.team
        // Assert
        XCTAssertEqual(realResult, expectedResult)
    }
    
    /// Метод loadWords класса PlayInteractor вызывает метод getWords свойства wordsProvider один раз
    func testPlayInteractorLoadWordsCallsWordsProviderGetWordsOneTime() {
        
        // Arrange
        let expectedCalls = 1
        // Act
        interactor.loadWords()
        usleep(100_000)
        // Assert
        mockWordsProvider.verifyGetWordsCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    

    func testPlayInteractorSetupTimeSetsTimeLeftOfSixty() {
        // Arrange
        let expectedResult = 60
        // Act
        interactor.setupTime()
        let realResult = interactor.timeLeft / 10
        // Assert
        XCTAssertEqual(realResult, expectedResult)
        
    }
    
    /// Метод tic класса PlayInteractor вызывает метод tac свойства output один раз
    func testPlayInteractorTicCallsOutputTacOneTime() {
        // Arrange
        let expectedCalls = 1
        // Act
        interactor.tic()
        // Assert
        output.verifyTacCallsCount{ realCalls in
            XCTAssertGreaterThanOrEqual(realCalls, expectedCalls)
        }
    }
    

}
