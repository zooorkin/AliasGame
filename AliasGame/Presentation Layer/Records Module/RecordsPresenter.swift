//
//  RecordsPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol RecordsPresenterInput {
    
    var router: RecordsRouterInput? { get set }
    
    var output: RecordsPresenterOutput? { get set }
    
    func exitTapped()
    
}

protocol RecordsPresenterOutput: class {
    
}

protocol RecordsRouterInput: class {
    
    func exitFromRecordsModule()
    
}

class RecordsPresenter: RecordsPresenterInput {
    
    weak var router: RecordsRouterInput?
    
    weak var output: RecordsPresenterOutput?
    
    private var interactor: RecordsInteractorInput
    
    
    init(interactor: RecordsInteractorInput) {
        self.interactor = interactor
    }
    
    @objc func exitTapped() {
        if let router = router {
            router.exitFromRecordsModule()
        } else {
            #if DEBUG
            debugPrint("[RecordsPresenter]: router is nil")
            #endif
        }
    }
    
}

extension RecordsPresenter: RecordsInteractorOutput {
    
}
