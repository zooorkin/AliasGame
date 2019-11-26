//
//  ImageClassificator.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ImageClassificatorProtocol {

    var delegate: ImageClassificatorDelegate? { get set }

}


protocol ImageClassificatorDelegate {

}


class ImageClassificator: ImageClassificatorProtocol {

    var delegate: ImageClassificatorDelegate?

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

extension ImageClassificator: NetworkingDelegate {
    
}

extension ImageClassificator: MachineLearningDelegate {
    
}

extension ImageClassificator: CoreDataStackDelegate {
    
}
