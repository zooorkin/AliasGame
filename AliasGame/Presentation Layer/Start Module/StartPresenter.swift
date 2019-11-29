//
//  StartPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol StartPresenterInput {

    var router: StartRouterInput? { get set }

    var output: StartPresenterOutput? { get set }
    
    func gameModeTapped(withMode mode: AliasGameMode)

    func recordsButtonTapped()
    
    func settingsButtonTapped()
    
    func aboutGameButtonTapped()
    
    func reservedButtonTapped()
    
}

protocol StartPresenterOutput: class {

}

protocol StartRouterInput: class {
    
    func play(mode: AliasGameMode)
    
    func records()
    
    func settings()
    
    func aboutGame()
    
}

class StartPresenter: StartPresenterInput {

    weak var router: StartRouterInput?

    weak var output: StartPresenterOutput?

    private var interactor: StartInteractor


    init(interactor: StartInteractor) {
        self.interactor = interactor
    }
    
    func gameModeTapped(withMode mode: AliasGameMode) {
        if let router = router {
            router.play(mode: mode)
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: router is nil")
            #endif
        }
    }
    
    func recordsButtonTapped() {
        if let router = router {
            router.records()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: router is nil")
            #endif
        }
    }
    
    func settingsButtonTapped() {
        if let router = router {
            router.settings()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: router is nil")
            #endif
        }
    }
    
    func aboutGameButtonTapped() {
        if let router = router {
            router.aboutGame()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: router is nil")
            #endif
        }
    }
    
    func reservedButtonTapped() {
        #if DEBUG
        debugPrint("[StartPresenter]: function reservedButtonTapped not implemented")
        #endif
    }

}

extension StartPresenter: StartInteractorOutput {
    
}
