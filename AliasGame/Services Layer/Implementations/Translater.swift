//
//  TranslateService.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol TranslaterProtocol {

    var delegate: TranslaterDelegate? { get set }

}


protocol TranslaterDelegate {

}


class Translater: TranslaterProtocol {

    var delegate: TranslaterDelegate?

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

extension Translater: NetworkingDelegate {
    
}

extension Translater: MachineLearningDelegate {
    
}

extension Translater: CoreDataStackDelegate {
    
}
