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
    
    var configuration: AliasGameConfiguration { get }
    
    func set(numberOfRounds: Int)
    
    func set(timeForSet: Int)
    
}

protocol PrePlayInteractorOutput: class {
    
}

class PrePlayInteractor: PrePlayInteractorInput {
    
    weak var output: PrePlayInteractorOutput?
    
    let mode: AliasGameMode
    
    var numberOfRounds = 3
    
    var timeForSet = 5
    
    var configuration: AliasGameConfiguration {
        return AliasGameConfiguration(mode: mode, numberOfRounds: numberOfRounds, timeForSet: timeForSet)
    }
    
    init(mode: AliasGameMode) {
        self.mode = mode
    }
    
    func set(numberOfRounds: Int) {
        self.numberOfRounds = numberOfRounds
    }
    
    func set(timeForSet: Int) {
        self.timeForSet = timeForSet
    }

}
