//
//  StubPrePlayInteractor.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class StubPrePlayInteractor: PrePlayInteractorInput {
    
    init(configuration: AliasGameConfiguration) {
        self.configuration = configuration
    }
    
    var output: PrePlayInteractorOutput?
    
    var configuration: AliasGameConfiguration
    
    func set(numberOfRounds: Int) {
        fatalError("\(#function) is not implemented")
    }
    
    func set(timeForSet: Int) {
        fatalError("\(#function) is not implemented")
    }
    
}
