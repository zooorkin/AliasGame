//
//  MockWordsProvider.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class MockWordsProvider: WordsProviderProtocol {
    
    /// Число вызовов функции getWords
    private var getWordsCallsCount = 0
    
    /// Проверка числа вызовов функции getWords
    func verifyGetWordsCallsCount(block: (Int) -> Void) {
        block(getWordsCallsCount)
    }
    
    var error: Bool = false
    
    var delegate: WordsProviderDelegate?
    
    func getWords(number: Int, language: Word.Language, category: Word.Category) {
        getWordsCallsCount += 1
        if !error {
            delegate?.wordsProviderDidGetWords(words: .init(repeating: "", count: number))
        } else {
            delegate?.wordsProviderDidNotGetWords()
        }
    }
    
}
