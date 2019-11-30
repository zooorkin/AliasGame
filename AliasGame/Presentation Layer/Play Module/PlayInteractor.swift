//
//  PlayInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol PlayInteractorInput {

    var output: PlayInteractorOutput? { get set }
    
    func loadWords()
    
    func getNextWord() -> String?
    
    var words: [String] { get }
    
    func wordWasGuessed()
    
    func wordWasNotGuessed()
    
    var team: Int { get }
    
    var round: Int { get }

}

protocol PlayInteractorOutput: class {
    
    func interactorFailedAction(with message: String)
    
    func interactorLoadedWords()

}

class PlayInteractor: PlayInteractorInput {

    weak var output: PlayInteractorOutput?
    
    private var gameMode: AliasGameMode
    

    private var wordsProvider: WordsProviderProtocol
    
    private var imageProvider: ImageProviderProtocol
    
    private var translater: TranslaterProtocol
    
    private var imageClassificator: ImageClassificatorProtocol
    
    private var gameDataSaver: GameDataSaverProtocol
    
    
    var words: [String] = []
    
    private var currentWord: String?
    
    private var guessedWords: [String] = []
    
    private var notGuessedWords: [String] = []
    
    var team: Int = 0
    
    var round: Int = 0
    
    func getNextWord() -> String? {
        if !words.isEmpty {
            let currentWord = words.removeFirst()
            self.currentWord = currentWord
            return currentWord
        } else {
            return nil
        }
    }
    
    func wordWasGuessed() {
        if let currentWord = currentWord {
            guessedWords.append(currentWord)
        } else {
            print("[PlayInteractor]: curentWord is nil")
        }
    }
    
    func wordWasNotGuessed() {
        if let currentWord = currentWord {
            notGuessedWords.append(currentWord)
        } else {
            print("[PlayInteractor]: curentWord is nil")
        }
    }
    
    
    init(mode: AliasGameMode, wordsProvider: WordsProviderProtocol, imageProvider: ImageProviderProtocol, translater: TranslaterProtocol, imageClassificator: ImageClassificatorProtocol, gameDataSaver: GameDataSaverProtocol) {
        self.gameMode = mode
        self.wordsProvider = wordsProvider
        self.imageProvider = imageProvider
        self.translater = translater
        self.imageClassificator = imageClassificator
        self.gameDataSaver = gameDataSaver
        self.wordsProvider.delegate = self
        self.imageProvider.delegate = self
        self.imageClassificator.delegate = self
        self.gameDataSaver.delegate = self
    }
    
    func loadWords() {
        wordsProvider.getWords(number: 20)
    }
    
}

extension PlayInteractor: WordsProviderDelegate {
    
    func wordsProviderDidGetWords(words: [String]) {
        guard let output = output else {
            assertionFailure("[PlayInteractor]: output is nil")
            return
        }
        
        translater.translate(englishWord: words.joined(separator: "\n")) { result in
            switch result {
            case .success(let translation):
                let translatedWords = translation.split(separator: "\n")
                let translatedWordsAsArrayOfStrings = translatedWords.map { String($0).uppercasedFirstLetter() }
                self.words = translatedWordsAsArrayOfStrings
                output.interactorLoadedWords()
            case .failure(let error):
                output.interactorFailedAction(with: error.localizedDescription)
            }
        }
    }
    
    func wordsProviderDidNotGetWords() {
        if let output = output {
            output.interactorFailedAction(with: "Не удалось загрузить слова")
        } else {
            assertionFailure("[PlayInteractor]: output is nil")
        }
    }
    
}

extension PlayInteractor: ImageProviderDelegate {
    
}

extension PlayInteractor: ImageClassificatorDelegate {
    
}

extension PlayInteractor: GameDataSaverDelegate {
    
}
