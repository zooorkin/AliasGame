//
//  AboutInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol AboutInteractorInput {
    
    var output: AboutInteractorOutput? { get set }
    
}

protocol AboutInteractorOutput: class {
    
}

class AboutInteractor: AboutInteractorInput {
    
    weak var output: AboutInteractorOutput?

    init() {
        
    }
    
}
