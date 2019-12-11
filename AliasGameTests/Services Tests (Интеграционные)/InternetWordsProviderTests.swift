//
//  InternetWordsProviderTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class InternetWordsProviderTests: XCTestCase {
    
    var internetWordsProvider: InternetWordsProvider!
    
    var mockDelegate: MockWordsProviderDelegate!

    override func setUp() {
        super.setUp()
        let session = URLSession.shared
        let networking = Networking(session: session)
        internetWordsProvider = InternetWordsProvider(networking: networking)
        mockDelegate = MockWordsProviderDelegate()
        internetWordsProvider.delegate = mockDelegate
    }

    override func tearDown() {
        internetWordsProvider = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    /// Метод getWords класса InternetWordsProvider вызывает метод wordsProviderDidGetWords свойства delegate один раз
    func testInternetWordsProviderGetWordsCallsDelegateWordsProviderDidGetWordsOneTime() {
        // Arrange
        let numberOfWords = 10
        let language = Word.Language.english
        let category = Word.Category.any
        let expectedCalls = 1
        // Act
        internetWordsProvider.getWords(number: numberOfWords, language: language, category: category)
        sleep(2)
        // Assert
        mockDelegate.verifyWordsProviderDidGetWordsCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls, "Неудалось загрузить cлова, возможно проблема в интернете")
        }
    }

    /// Метод getWords класса InternetWordsProvider вызывает метод wordsProviderDidNotGetWords свойства delegate один раз
    func testInternetWordsProviderGetWordsCallsDelegateWordsProviderDidNotGetWordsOneTime() {
        // Arrange
        let numberOfWords = -10
        let language = Word.Language.english
        let category = Word.Category.any
        let expectedCalls = 1
        // Act
        internetWordsProvider.getWords(number: numberOfWords, language: language, category: category)
        sleep(1)
        // Assert
        mockDelegate.verifyWordsProviderDidNotGetWordsCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls, "Неудалось загрузить cлова, возможно проблема в интернете")
        }
    }

}
