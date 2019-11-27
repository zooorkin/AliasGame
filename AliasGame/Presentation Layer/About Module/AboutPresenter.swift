//
//  AboutPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol AboutPresenterInput {
    
    var router: AboutRouterInput? { get set }
    
    var output: AboutPresenterOutput? { get set }
    
    func exitTapped()
    
}

protocol AboutPresenterOutput: class {
    
}

protocol AboutRouterInput: class {
    
    func exitFromAboutModule()
    
}

class AboutPresenter: AboutPresenterInput {
    
    weak var router: AboutRouterInput?
    
    weak var output: AboutPresenterOutput?
    
    private var interactor: AboutInteractorInput
    
    
    init(interactor: AboutInteractorInput) {
        self.interactor = interactor
    }
    
    @objc func exitTapped() {
        if let router = router {
            router.exitFromAboutModule()
        } else {
            #if DEBUG
            debugPrint("[AboutPresenter]: router is nil")
            #endif
        }
    }
    
}

extension AboutPresenter: AboutInteractorOutput {
    
}
