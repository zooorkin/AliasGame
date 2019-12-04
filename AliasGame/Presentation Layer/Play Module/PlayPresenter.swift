//
//  PlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol PlayPresenterInput {

    var router: PlayRouterInput? { get set }

    var output: PlayPresenterOutput? { get set }
    
    func viewDidLoad()
    
    func viewDidAppear()
    
    func pauseButtonTapped()
    
    func successButtonTapped()
    
    func failureButtonTapped()
    
    func exitTapped()

}

protocol PlayPresenterOutput: class {

    func setCurrentWord(word: String)
    
    func setCurrentTeam(name: String)
    
    func setCurrentRound(number: Int)
    
    func setImages(images: [UIImage?], animated: Bool)
    
    func performSlide(images: [UIImage?])
    
    func showAlert(with message: String, completion: @escaping () -> Void)
    
}

protocol PlayRouterInput: class {
    
    func showResult(teamResult: TeamResult, roundResult: RoundResult?, gameResult: GameResult?)
    
    func exitFromPlayModule()
    
    func playModuleDidLoadWords()
    
    func playModuleDidNotLoadWords()

}

class PlayPresenter: PlayPresenterInput {

    weak var router: PlayRouterInput?

    weak var output: PlayPresenterOutput?

    private var interactor: PlayInteractorInput


    init(interactor: PlayInteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - Элементы синхронизации
    
    let locker = NSLock()
    
    let queue = DispatchQueue.global(qos: .userInitiated)
    
    func viewDidAppear() {
        interactor.startTimer()
    }
    
    func viewDidLoad() {
        interactor.loadWords()
    }
    
    func pauseButtonTapped() {
        
    }
    
    private var guessedWords: [AliasWord] = []
    
    private var notGuessedWords: [AliasWord] = []
    
    func successButtonTapped() {
        wordGuessed(true)
        nextWord()
    }
    
    func failureButtonTapped() {
        wordGuessed(false)
        nextWord()
    }
    
    private func updateUI(animated: Bool) {
        guard let output = output else {
            debugPrint("[PlayPresenter]: output is nil")
            return
        }
        let teamName = "Команда \(interactor.team + 1)"
        let roundNumber = interactor.round + 1
        
        output.setCurrentRound(number: roundNumber)
        output.setCurrentTeam(name: teamName)
        guard interactor.words.count >= 3 else {
            assertionFailure("[PlayPresenter]: Недостаточно слов")
            return
        }
        output.setCurrentWord(word: interactor.words[currentWordIndex].word)
        output.setImages(images: [firstImage, secondImage, thirdImage], animated: animated)
    }
    
    var currentWordIndex = 0
    
    var defaultImage: UIImage? {
        return UIImage(color: getRandomColor())
    }
    
    var firstImage: UIImage? {
        return interactor.words[currentWordIndex].image ?? defaultImage
    }
    
    var secondImage: UIImage? {
        return currentWordIndex + 1 < interactor.words.count ? interactor.words[currentWordIndex + 1].image ?? defaultImage : nil
    }
    
    var thirdImage: UIImage? {
        return currentWordIndex + 2 < interactor.words.count ? interactor.words[currentWordIndex + 2].image ?? defaultImage: nil
    }
    
    private func wordGuessed(_ guessed: Bool) {
        let word = interactor.words[currentWordIndex]
        if guessed {
            guessedWords.append(word)
        } else {
            notGuessedWords.append(word)
        }
    }
    
    private func nextWord() {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        locker.lock()
        currentWordIndex += 1
        let currentWordIndex = self.currentWordIndex
        locker.unlock()
        if currentWordIndex >= interactor.words.count {
            return
        }
        output.setCurrentWord(word: interactor.words[currentWordIndex].word)
        output.performSlide(images: [firstImage, secondImage, thirdImage])
    }
    
    func exitTapped() {
        interactor.stopTimer()
        if let router = router {
            router.exitFromPlayModule()
        } else {
            #if DEBUG
            debugPrint("[PlayPresenter]: router is nil")
            #endif
        }
    }

}

extension PlayPresenter: PlayInteractorOutput {

    func interactorFailedAction(with message: String) {
        if let output = output {
            output.showAlert(with: message) {
                if let router = self.router {
                    router.exitFromPlayModule()
                } else {
                    assertionFailure("[PlayPresenter]: router is nil")
                }
            }
        } else {
            assertionFailure("[PlayPresenter]: output is nil")
        }
    }
    
    func interactorDidLoadWords() {
        currentWordIndex = 0
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        updateUI(animated: false)
        DispatchQueue.main.async {
            router.playModuleDidLoadWords()
        }
    }
    
    func interactorDidNotLoadWords() {
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        DispatchQueue.main.async {
            router.playModuleDidNotLoadWords()
        }
    }
    
    func timeIsOver() {
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        router.showResult(teamResult: .init(), roundResult: nil, gameResult: nil)
        interactor.loadWords()
    }
    
}
