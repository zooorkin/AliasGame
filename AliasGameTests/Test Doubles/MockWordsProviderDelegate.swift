//
//  MockWordsProviderDelegate.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class MockWordsProviderDelegate: WordsProviderDelegate {
    
    /// Число вызовов функции wordsProviderDidGetWords
    private var wordsProviderDidGetWordsCallsCount = 0
    /// Число вызовов функции wordsProviderDidNotGetWords
    private var wordsProviderDidNotGetWordsCallsCount = 0
    
    
    func wordsProviderDidGetWords(words: [String]) {
        wordsProviderDidGetWordsCallsCount += 1
    }
    func wordsProviderDidNotGetWords() {
        wordsProviderDidNotGetWordsCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции wordsProviderDidGetWords
    func verifyWordsProviderDidGetWordsCallsCount(block: (Int) -> Void) {
        block(wordsProviderDidGetWordsCallsCount)
    }
    
    /// Проверка числа вызовов функции wordsProviderDidNotGetWords
    func verifyWordsProviderDidNotGetWordsCallsCount(block: (Int) -> Void) {
        block(wordsProviderDidNotGetWordsCallsCount)
    }
}
