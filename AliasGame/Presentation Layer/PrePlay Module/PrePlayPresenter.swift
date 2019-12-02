//
//  PrePlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 02/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol PrePlayPresenterInput {
    
    var router: PrePlayRouterInput? { get set }
    
    var output: PrePlayPresenterOutput? { get set }
    
    func exitTapped()
    
    func startGameButtonTapped()
    
}

protocol PrePlayPresenterOutput: class {
    
}

protocol PrePlayRouterInput: class {
    
    func exitFromPrePlayModule()
    
    func startGameFromPrePlayModule()
    
}

class PrePlayPresenter: PrePlayPresenterInput {
    
    weak var router: PrePlayRouterInput?
    
    weak var output: PrePlayPresenterOutput?
    
    private var interactor: PrePlayInteractorInput
    
    
    init(interactor: PrePlayInteractorInput) {
        self.interactor = interactor
    }
    
    func exitTapped() {
        if let router = router {
            router.exitFromPrePlayModule()
        } else {
            #if DEBUG
            debugPrint("[PlayPresenter]: router is nil")
            #endif
        }
    }
    
    func startGameButtonTapped() {
        if let router = router {
            router.startGameFromPrePlayModule()
        } else {
            #if DEBUG
            debugPrint("[PlayPresenter]: router is nil")
            #endif
        }
    }
    
}

extension PrePlayPresenter: PrePlayInteractorOutput {
    
}
