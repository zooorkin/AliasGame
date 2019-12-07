//
//  PlayInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol PlayInteractorInput {

    var output: PlayInteractorOutput? { get set }
    
    var configuration: AliasGameConfiguration { get }
    
    var words: [AliasWord] { get }
    
    var team: Int { get }
    
    var round: Int { get }
    
    var scores: [Int] { get }
    
    var timeLeft: Int { get }
    
    func nextTeam(withSaving score: Int)
    
    func nextRound()
    
    func loadWords()
    
    func startTimer()
    
    func stopTimer()
    
    func setupTime()

}

protocol PlayInteractorOutput: class {
    
    func interactorFailedAction(with message: String)
    
    func interactorDidLoadWords()
    
    func interactorDidNotLoadWords()
    
    func timeIsOver()
    
    func tac()

}

class PlayInteractor: PlayInteractorInput {
    
    private let wordsCountForSet = 48 // Столько слов в наборе для презентации
    

    weak var output: PlayInteractorOutput?

    private var wordsProvider: WordsProviderProtocol
    
    private var imageProvider: ImageProviderProtocol
    
    private var translater: TranslaterProtocol
    
    private var imageClassificator: ImageClassificatorProtocol
    
    private var gameDataSaver: GameDataSaverProtocol
    
    var words: [AliasWord] = []
    
    private var currentImage: UIImage?
    
    
    var configuration: AliasGameConfiguration
    
    var team: Int = 0
    
    var round: Int = 0
    
    var scores: [Int]
    
    var timeLeft: Int = 0

    var timer: Timer?
    
    private var configurationToTranslate = false
    
    init(configuration: AliasGameConfiguration, wordsProvider: WordsProviderProtocol, imageProvider: ImageProviderProtocol, translater: TranslaterProtocol, imageClassificator: ImageClassificatorProtocol, gameDataSaver: GameDataSaverProtocol) {
        self.configuration = configuration
        self.wordsProvider = wordsProvider
        self.imageProvider = imageProvider
        self.translater = translater
        self.imageClassificator = imageClassificator
        self.gameDataSaver = gameDataSaver
        self.scores = [Int](repeating: 0, count: configuration.numberOfTeams)
        
        self.wordsProvider.delegate = self
        self.imageProvider.delegate = self
        self.imageClassificator.delegate = self
        self.gameDataSaver.delegate = self
    }
    
    func loadWords() {
        DispatchQueue.global(qos: .userInitiated).async {
            let wordListIndex = UserDefaults.standard.integer(forKey: "wordList")
            switch wordListIndex {
                
            case 0: self.wordsProvider.getWords(number: self.wordsCountForSet, language: .russian, category: .presentation)
                
            case 1: self.wordsProvider.getWords(number: self.wordsCountForSet, language: .russian, category: .noun)
            case 2: self.wordsProvider.getWords(number: self.wordsCountForSet, language: .russian, category: .verb)
            case 3: self.wordsProvider.getWords(number: self.wordsCountForSet, language: .russian, category: .adjective)
                
            case 4: self.wordsProvider.getWords(number: self.wordsCountForSet, language: .english, category: .noun)
            case 5: self.wordsProvider.getWords(number: self.wordsCountForSet, language: .english, category: .verb)
                
            default:
                assertionFailure("[PlayInteractor]: неизвестный индекс для списка слов")
            }
            
        }
    }
    
    func setupTime() {
        timeLeft = configuration.timeForSet * 10
    }
    
    func startTimer() {
        DispatchQueue.main.async {
            self.timer = .scheduledTimer(withTimeInterval: 0.1, repeats: true) {
                [weak self] timer in
                self?.tic()
            }
        }
    }
    
    func tic() {
        timeLeft -= 1
        guard let output = self.output else {
            debugPrint("[PlayInteractor]: output is nil")
            return
        }
        output.tac()
        if timeLeft == 0 {
            stopTimer()
            output.timeIsOver()
        }
    }
    
    func stopTimer() {
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
    }
    
    func nextTeam(withSaving score: Int) {
        scores[team] += score
        team += 1
    }
    
    func nextRound() {
        team = 0
        round += 1
    }
    
}

extension PlayInteractor: WordsProviderDelegate {
    
    func wordsProviderDidGetWords(words: [String]) {
        guard let output = output else {
            assertionFailure("[PlayInteractor]: output is nil")
            return
        }
        guard words.count == wordsCountForSet else {
            debugPrint("[PlayInteractor]: Количество полученных слов не соотвествует количеству запрошенных")
            output.interactorDidNotLoadWords()
            output.interactorFailedAction(with: "Не удалось загрузить слова")
            return
        }
        
        if configurationToTranslate {
            translater.translate(englishWord: words.joined(separator: "\n")) { result in
                switch result {
                case .success(let translation):
                    let translatedWords = translation.split(separator: "\n").map { String($0).uppercasedFirstLetter() }
                    guard words.count == translatedWords.count else {
                        output.interactorDidNotLoadWords()
                        return
                    }
                    for index in 0 ..< words.count {
                        let wordWithTranslation = AliasWord(word: words[index], translate: translatedWords[index], image: nil)
                        self.words.append(wordWithTranslation)
                    }
                    
                case .failure(let error):
                    output.interactorFailedAction(with: error.localizedDescription)
                    return
                }
            }
        } else {
            self.words = words.map { AliasWord(word: $0, translate: nil, image: nil) }
        }
        let group = DispatchGroup()
        for index in 0 ..< wordsCountForSet {
            group.enter()
            imageProvider.getImage(with: self.words[index].word) { image in
                self.words[index].image = image
                group.leave()
            }
        }
        let image = UIImage(color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        self.words.append(AliasWord(word: "Слова закончились", translate: nil, image: image))
        group.wait()
        output.interactorDidLoadWords()
    }
    
    func wordsProviderDidNotGetWords() {
        if let output = output {
            output.interactorDidNotLoadWords()
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
