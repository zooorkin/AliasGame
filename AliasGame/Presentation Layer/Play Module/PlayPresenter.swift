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
    
}
