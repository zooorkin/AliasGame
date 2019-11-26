//
//  StartInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol StartInteractorInput {

    var output: StartInteractorOutput? { get set }

}

protocol StartInteractorOutput: class {

}

class StartInteractor: StartInteractorInput {

    weak var output: StartInteractorOutput?
    
    init() {
        
    }
    
}
