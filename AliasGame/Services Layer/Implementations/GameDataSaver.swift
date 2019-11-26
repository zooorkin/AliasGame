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


protocol GameDataSaverDelegate {
    
}


class GameDataSaver: GameDataSaverProtocol {
    
    var delegate: GameDataSaverDelegate?
    
    private var networking: NetworkingProtocol
    
    private var machineLearning: MachineLearningProtocol
    
    private var coreDataStack: CoreDataStackProtocol
    
    
    init(networking: NetworkingProtocol, machineLearning: MachineLearningProtocol, coreDataStack: CoreDataStackProtocol) {
        self.networking = networking
        self.machineLearning = machineLearning
        self.coreDataStack = coreDataStack
        self.networking.delegate = self
        self.machineLearning.delegate = self
        self.coreDataStack.delegate = self
    }
    
    
}

extension GameDataSaver: NetworkingDelegate {
    
}

extension GameDataSaver: MachineLearningDelegate {
    
}

extension GameDataSaver: CoreDataStackDelegate {
    
}
