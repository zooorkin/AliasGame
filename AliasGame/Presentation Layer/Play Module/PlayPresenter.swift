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
    
    func pauseButtonTapped()
    
    func successButtonTapped()
    
    func failureButtonTapped()
    
    func exitTapped()

}

protocol PlayPresenterOutput: class {

    func setCurrentWord(word: String)
    
    func setCurrentTeam(name: String)
    
    func setCurrentRound(number: Int)
    
    func setCenterImage(image: UIImage?)
    
    func setRightImage(image: UIImage?)
    
    func setRightRightImage(image: UIImage?)
    
    func showAlert(with message: String, completion: @escaping () -> Void)
    
}

protocol PlayRouterInput: class {
    
    func exitFromPlayModule()

}

class PlayPresenter: PlayPresenterInput {

    weak var router: PlayRouterInput?

    weak var output: PlayPresenterOutput?

    private var interactor: PlayInteractorInput


    init(interactor: PlayInteractorInput) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.loadWords()
        updateUI()
    }
    
    func pauseButtonTapped() {
        
    }
    
    private var guessedWords: [AliasWord] = []
    
    private var notGuessedWords: [AliasWord] = []
    
    func successButtonTapped() {
        nextWord(previousWasGuessed: true)
    }
    
    func failureButtonTapped() {
        nextWord(previousWasGuessed: false)
    }
    
    private func updateUI() {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        output.setCurrentRound(number: interactor.round + 1)
        let teamName = "Команда \(interactor.team + 1)"
        output.setCurrentTeam(name: teamName)
    }
    
    var currentWordIndex = -1
    
    private func nextWord(previousWasGuessed: Bool) {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        currentWordIndex += 1
        if currentWordIndex >= interactor.words.count {
            output.showAlert(with: "Слова закончились", completion: { self.router?.exitFromPlayModule() })
            
            return
        }
        if currentWordIndex != 0 {
            if previousWasGuessed {
                guessedWords.append(interactor.words[currentWordIndex - 1])
            } else {
                notGuessedWords.append(interactor.words[currentWordIndex - 1])
            }
        }
        let defaultImage = UIImage(color: getRandomColor())
        output    .setCurrentWord(word: interactor.words[currentWordIndex].word)
        output    .setCenterImage(image: interactor.words[currentWordIndex].image ?? defaultImage)
        output     .setRightImage(image: currentWordIndex + 1 < interactor.words.count ? interactor.words[currentWordIndex + 1].image ?? defaultImage : nil)
        output.setRightRightImage(image: currentWordIndex + 2 < interactor.words.count ? interactor.words[currentWordIndex + 2].image ?? defaultImage: nil)
    }
    
    func exitTapped() {
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
        nextWord(previousWasGuessed: true)
    }
    
    func interactorDidNotLoadWords() {
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        output.showAlert(with: "Не удалось загрузить слова") {
            router.exitFromPlayModule()
        }
    }
    
}
