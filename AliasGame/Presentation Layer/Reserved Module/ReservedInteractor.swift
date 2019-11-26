//
//  ReservedInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ReservedInteractorInput {
    
    var output: ReservedInteractorOutput? { get set }
    
}

protocol ReservedInteractorOutput: class {
    
}

class ReservedInteractor: ReservedInteractorInput {
    
    weak var output: ReservedInteractorOutput?
    
    init() {

    }
    
}

