//
//  WordsProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol WordsProviderProtocol {

    var delegate: WordsProviderDelegate? { get set }
    
    func requestKey()
    
    func getWords(number: Int)

}


protocol WordsProviderDelegate {

    func wordsProviderDidGetKey()
    
    func wordsProviderDidNotGetKey()
    
    func wordsProviderDidGetWords(words: [String])
    
    func wordsProviderDidNotGetWords()
    
}


class WordsProvider: WordsProviderProtocol {

    var delegate: WordsProviderDelegate?

    private var session: URLSession
    
    private var key = ""

    init(networking: NetworkingProtocol) {
        self.session = networking.session
    }
    
    func getWords(number: Int) {
        guard let delegate = delegate else {
            assertionFailure("[WordsProvider]: delegate is nil")
            return
        }
        // 10 %
        let extraWordsToDeleteRareDublicates = number / 10
        let totalWordsToDownload = extraWordsToDeleteRareDublicates + number
        
        guard let getWordsURL = RandomWordAPI.getWordsURL(key: key, number: totalWordsToDownload) else {
            print("[WordsProvider]: getWordsURL is nil")
            delegate.wordsProviderDidNotGetWords()
            return
        }
        
        let task = session.dataTask(with: getWordsURL) { (data, response, error) in
            guard let data = data else {
                print("[WordsProvider]: data is nil")
                delegate.wordsProviderDidNotGetWords()
                return
            }
            do {
                let words = try JSONDecoder().decode([String].self, from: data)
                let uniqueWords = [String](words.uniqueElements().prefix(number))
                if uniqueWords.count == number {
                    delegate.wordsProviderDidGetWords(words: uniqueWords)
                } else {
                    delegate.wordsProviderDidNotGetWords()
                }
            } catch {
                print("[WordsProvider]: words were not decoded")
                delegate.wordsProviderDidNotGetWords()
            }
        }
        task.resume()
    }
    
    func requestKey() {
        key.isEmpty ? loadNewKey() : loadCachedKey()
    }
    
    private func loadCachedKey() {
        guard let delegate = delegate else {
            assertionFailure("[WordsProvider]: delegate is nil")
            return
        }
        delegate.wordsProviderDidGetKey()
    }
    
    private func loadNewKey() {
        guard let delegate = delegate else {
            assertionFailure("[WordsProvider]: delegate is nil")
            return
        }
        guard let getKeyURL = URL(string: RandomWordAPI.getKeyURL) else {
            assertionFailure("[WordsProvider]: url is nil")
            return
        }
        let task = session.dataTask(with: getKeyURL) { (data, response, error) in
            if let data = data {
                if let key = String(data: data, encoding: .utf8) {
                    self.key = key
                    delegate.wordsProviderDidGetKey()
                } else {
                    delegate.wordsProviderDidNotGetKey()
                }
            } else {
                delegate.wordsProviderDidNotGetKey()
            }
        }
        task.resume()
    }
    
}
