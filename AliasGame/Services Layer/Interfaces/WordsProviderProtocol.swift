//
//  WordsProviderProtocol.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 01/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol WordsProviderProtocol {
    
    var delegate: WordsProviderDelegate? { get set }
    
    func getWords(number: Int, language: Word.Language, category: Word.Category)
    
}

protocol WordsProviderDelegate: class {
    
    func wordsProviderDidGetWords(words: [String])
    
    func wordsProviderDidNotGetWords()
    
}
