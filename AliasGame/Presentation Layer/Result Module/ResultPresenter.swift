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
    
    func nextFromResultModule(configuration: AliasGameConfiguration, nextTeam: Int)
    
}

class ResultPresenter: ResultPresenterInput {
    
    weak var router: ResultRouterInput?
    
    weak var output: ResultPresenterOutput?
    
    let configuration: AliasGameConfiguration
    
    let nextTeam: Int
    
    init(configuration: AliasGameConfiguration, nextTeam: Int) {
        self.configuration = configuration
        self.nextTeam = nextTeam
    }
    
    
    func buttonTapped() {
        if let router = router {
            router.nextFromResultModule(configuration: configuration, nextTeam: nextTeam)
        } else {
            #if DEBUG
            debugPrint("[ResultPresenter]: router is nil")
            #endif
        }
    }
    
}
