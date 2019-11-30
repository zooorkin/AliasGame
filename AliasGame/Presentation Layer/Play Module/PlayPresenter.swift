//
//  PlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

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
    
    func successButtonTapped() {
        interactor.wordWasGuessed()
        nextWord()
    }
    
    func failureButtonTapped() {
        interactor.wordWasNotGuessed()
        nextWord()
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
    
    private func nextWord() {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        if let word = interactor.getNextWord() {
            output.setCurrentWord(word: word)
        } else {
            output.showAlert(with: "Слова закончились", completion: { })
        }
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
    
    func interactorLoadedWords() {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        let words = interactor.words
        output.showAlert(with: "Загруженные слова:\n" + words.joined(separator: "\n"), completion: { })
        if let word = interactor.getNextWord() {
            output.setCurrentWord(word: word)
        } else {
            output.showAlert(with: "Слова закончились", completion: { })
        }
    }
    
}
