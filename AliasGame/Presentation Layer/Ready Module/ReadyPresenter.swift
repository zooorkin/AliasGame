//
//  ReadyPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol ReadyPresenterInput {
    
    func buttonTapped()
    
}

protocol ReadyPresenterOutput: class {
    
    func enableButton()
    
    func disableButton()
    
}

protocol ReadyRouterInput: class {
    
    func exitFromReadyModule()
    
    func letsPlayFromReadyModule()
    
}

class ReadyPresenter: ReadyPresenterInput {
    
    weak var router: ReadyRouterInput?
    
    weak var output: ReadyPresenterOutput?
    
    
    func buttonTapped() {
        if let router = router {
            router.letsPlayFromReadyModule()
            if let output = output {
                output.disableButton()
            } else {
                debugPrint("[ReadyPresenter]: output is nil")
            }
        } else {
            debugPrint("[ReadyPresenter]: router is nil")
        }
    }
    
    
}

extension ReadyPresenter: RouterDelegate {
    func wordsDidLoad() {
        guard let output = output else {
            debugPrint("[ReadyPresenter]: output is nil")
            return
        }
        output.enableButton()
    }
}
