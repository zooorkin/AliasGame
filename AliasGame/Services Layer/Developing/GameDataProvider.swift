//
//  GameDataProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 26/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol GameDataProviderProtocol {
    
    var delegate: GameDataProviderDelegate? { get set }
    
}


protocol GameDataProviderDelegate: class {
    
}


class GameDataProvider: GameDataProviderProtocol {
    
    weak var delegate: GameDataProviderDelegate?
    
    private var coreDataStack: CoreDataStackProtocol
    
    
    init(coreDataStack: CoreDataStackProtocol) {
        self.coreDataStack = coreDataStack
    }
    
}
