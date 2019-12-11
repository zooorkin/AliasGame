//
//  GameDataSaver.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 26/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol GameDataSaverProtocol {
    
    var delegate: GameDataSaverDelegate? { get set }
    
}


protocol GameDataSaverDelegate: class {
    
}


class GameDataSaver: GameDataSaverProtocol {
    
    weak var delegate: GameDataSaverDelegate?
    
    private var coreDataStack: CoreDataStackProtocol
    
    
    init(coreDataStack: CoreDataStackProtocol) {
        self.coreDataStack = coreDataStack
    }
    
    
}
