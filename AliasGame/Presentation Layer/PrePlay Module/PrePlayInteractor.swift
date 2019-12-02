//
//  PrePlayInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 02/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol PrePlayInteractorInput {
    
    var output: PrePlayInteractorOutput? { get set }
    
}

protocol PrePlayInteractorOutput: class {
    
}

class PrePlayInteractor: PrePlayInteractorInput {
    
    weak var output: PrePlayInteractorOutput?

}
