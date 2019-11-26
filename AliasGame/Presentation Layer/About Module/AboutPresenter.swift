//
//  AboutPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

@objc protocol AboutPresenterInput {
    
    var router: AboutRouterInput? { get set }
    
    var output: AboutPresenterOutput? { get set }
    
    func exitTapped()
    
}

@objc protocol AboutPresenterOutput {
    
}

@objc protocol AboutRouterInput {
    
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
