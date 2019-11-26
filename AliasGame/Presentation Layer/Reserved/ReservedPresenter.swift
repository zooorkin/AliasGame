//
//  ReservedPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

@objc protocol ReservedPresenterInput {
    
    var router: ReservedRouterInput? { get set }
    
    var output: ReservedPresenterOutput? { get set }
    
    func exitTapped()
    
}

@objc protocol ReservedPresenterOutput {
    
}

@objc protocol ReservedRouterInput {
    
    func exitFromReservedModule()
    
}

class ReservedPresenter: ReservedPresenterInput {
    
    weak var router: ReservedRouterInput?
    
    weak var output: ReservedPresenterOutput?
    
    private var interactor: ReservedInteractorInput
    
    
    init(interactor: ReservedInteractorInput) {
        self.interactor = interactor
    }
    
    @objc func exitTapped() {
        if let router = router {
            router.exitFromReservedModule()
        } else {
            #if DEBUG
            debugPrint("[ReservedPresenter]: router is nil")
            #endif
        }
    }
    
}

extension ReservedPresenter: ReservedInteractorOutput {
    
}
