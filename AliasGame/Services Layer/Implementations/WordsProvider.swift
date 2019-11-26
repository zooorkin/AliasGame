//
//  WordsProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol WordsProviderProtocol {

    var delegate: WordsProviderDelegate? { get set }

}


protocol WordsProviderDelegate {

}


class WordsProvider: WordsProviderProtocol {

    var delegate: WordsProviderDelegate?

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

extension WordsProvider: NetworkingDelegate {
    
}

extension WordsProvider: MachineLearningDelegate {
    
}

extension WordsProvider: CoreDataStackDelegate {
    
}
