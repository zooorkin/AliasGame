//
//  ResultPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol ResultPresenterInput {
    
    func buttonTapped()
    
}

protocol ResultPresenterOutput: class {
    
}

protocol ResultRouterInput: class {
    
    func exitFromResultModule()
    
    func nextFromResultModule()
    
}

class ResultPresenter: ResultPresenterInput {
    
    weak var router: ResultRouterInput?
    
    weak var output: ResultPresenterOutput?
    
    
    func buttonTapped() {
        if let router = router {
            router.nextFromResultModule()
        } else {
            #if DEBUG
            debugPrint("[ResultPresenter]: router is nil")
            #endif
        }
    }
    
}
