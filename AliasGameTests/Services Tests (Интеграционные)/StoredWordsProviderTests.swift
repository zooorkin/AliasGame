//
//  StoredWordsProviderTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class StoredWordsProviderTests: XCTestCase {
    
    var storedWordsProvider: StoredWordsProvider!
    
    var mockDelegate: MockWordsProviderDelegate!
    
    override func setUp() {
        super.setUp()
        let coreDataStack = CoreDataStack()
        storedWordsProvider = StoredWordsProvider(coreDataStack: coreDataStack)
        mockDelegate = MockWordsProviderDelegate()
        storedWordsProvider.delegate = mockDelegate
        
    }
    
    override func tearDown() {
        storedWordsProvider = nil
        mockDelegate = nil
        super.tearDown()
    }

    
    /// Метод getWords с аргументами .russian и .noun класса StoredWordsProvider вызывает
    /// метод wordsProviderDidGetWords свойства delegate один раз
    func testStoredWordsProviderGetWordsWithRussianNounCallsDelegateWordsProviderDidGetWordsOneTime() {
        // Arrange
        let numberOfWords = 10
        let language = Word.Language.russian
        let category = Word.Category.noun
        let expectedCalls = 1
        // Act
        storedWordsProvider.getWords(number: numberOfWords, language: language, category: category)
        sleep(1)
        // Assert
        mockDelegate.verifyWordsProviderDidGetWordsCallsCount{ realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
    /// Метод getWords с аргументами .deutsch и .any класса StoredWordsProvider вызывает
    /// метод wordsProviderDidNotGetWords свойства delegate один раз
    func testStoredWordsProviderGetWordsWithDeutschCallsDelegateWordsProviderDidNotGetWordsOneTime() {
        // Arrange
        let numberOfWords = 10
        let language = Word.Language.deutsch
        let category = Word.Category.any
        let expectedCalls = 1
        // Act
        storedWordsProvider.getWords(number: numberOfWords, language: language, category: category)
        sleep(1)
        // Assert
        mockDelegate.verifyWordsProviderDidNotGetWordsCallsCount { realCalls in
            XCTAssertEqual(realCalls, expectedCalls)
        }
    }
    
}
