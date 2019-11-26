//
//  SettingsInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol SettingsInteractorInput {
    
    var output: SettingsInteractorOutput? { get set }
    
}

protocol SettingsInteractorOutput: class {
    
}

class SettingsInteractor: SettingsInteractorInput {
    
    weak var output: SettingsInteractorOutput?
    
    init() {

    }
    
}
