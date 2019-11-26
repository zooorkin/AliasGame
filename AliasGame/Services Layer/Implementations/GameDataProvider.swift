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


protocol GameDataProviderDelegate {
    
}


class GameDataProvider: GameDataProviderProtocol {
    
    var delegate: GameDataProviderDelegate?
    
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

extension GameDataProvider: NetworkingDelegate {
    
}

extension GameDataProvider: MachineLearningDelegate {
    
}

extension GameDataProvider: CoreDataStackDelegate {
    
}
