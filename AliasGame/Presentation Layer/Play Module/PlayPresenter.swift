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
    
    func exitTapped()

}

protocol PlayPresenterOutput: class {

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
        interactor.loadWords(number: 20)
    }
    
    @objc func exitTapped() {
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
    
    func interactorLoadedWords(words: [String]) {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        output.showAlert(with: "Загруженные слова:\n" + words.joined(separator: "\n"), completion: { })
    }
    
}
