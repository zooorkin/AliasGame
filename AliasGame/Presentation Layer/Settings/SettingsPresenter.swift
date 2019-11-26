//
//  SettingsPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

@objc protocol SettingsPresenterInput {
    
    var router: SettingsRouterInput? { get set }
    
    var output: SettingsPresenterOutput? { get set }
    
    func exitTapped()
    
}

@objc protocol SettingsPresenterOutput {
    
}

@objc protocol SettingsRouterInput {
    
    func exitFromSettingsModule()
    
}

class SettingsPresenter: SettingsPresenterInput {
    
    weak var router: SettingsRouterInput?
    
    weak var output: SettingsPresenterOutput?
    
    private var interactor: SettingsInteractorInput
    
    
    init(interactor: SettingsInteractorInput) {
        self.interactor = interactor
    }
    
    @objc func exitTapped() {
        if let router = router {
            router.exitFromSettingsModule()
        } else {
            #if DEBUG
            debugPrint("[SettingsPresenter]: router is nil")
            #endif
        }
    }
    
}

extension SettingsPresenter: SettingsInteractorOutput {
    
}
