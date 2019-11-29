//
//  PlayInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol PlayInteractorInput {

    var output: PlayInteractorOutput? { get set }
    
    func loadWords(number: Int)

}

protocol PlayInteractorOutput: class {
    
    func interactorFailedAction(with message: String)
    
    func interactorLoadedWords(words: [String])

}

class PlayInteractor: PlayInteractorInput {

    weak var output: PlayInteractorOutput?

    private var wordsProvider: WordsProviderProtocol
    
    private var imageProvider: ImageProviderProtocol
    
    private var translater: TranslaterProtocol
    
    private var imageClassificator: ImageClassificatorProtocol
    
    private var gameDataSaver: GameDataSaverProtocol
    
    private var keyIsValid = false
    
    private var taskToDo: (() -> Void)?
    
    
    init(wordsProvider: WordsProviderProtocol, imageProvider: ImageProviderProtocol, translater: TranslaterProtocol, imageClassificator: ImageClassificatorProtocol, gameDataSaver: GameDataSaverProtocol) {
        self.wordsProvider = wordsProvider
        self.imageProvider = imageProvider
        self.translater = translater
        self.imageClassificator = imageClassificator
        self.gameDataSaver = gameDataSaver
        self.wordsProvider.delegate = self
        self.imageProvider.delegate = self
        self.imageClassificator.delegate = self
        self.gameDataSaver.delegate = self
        wordsProvider.requestKey()
    }
    
    func loadWords(number: Int) {
        if keyIsValid {
            wordsProvider.getWords(number: number)
        } else {
            wordsProvider.requestKey()
            taskToDo = {
                self.wordsProvider.getWords(number: number)
            }
        }
    }
    
}

extension PlayInteractor: WordsProviderDelegate {
    func wordsProviderDidGetKey() {
        keyIsValid = true
        if let taskToDo = taskToDo {
            taskToDo()
            self.taskToDo = nil
        }
        
    }
    
    func wordsProviderDidNotGetKey() {
        if let output = output {
            output.interactorFailedAction(with: "Не удалось загрузить ключ доступа к серверу слов")
        } else {
            assertionFailure("[PlayInteractor]: output is nil")
        }
    }
    
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
                output.interactorLoadedWords(words: translatedWordsAsArrayOfStrings)
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
