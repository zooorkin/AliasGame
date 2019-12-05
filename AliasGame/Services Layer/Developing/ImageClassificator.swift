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

    private var machineLearning: MachineLearningProtocol

    init(machineLearning: MachineLearningProtocol) {
        self.machineLearning = machineLearning
        self.machineLearning.delegate = self
    }

}

extension ImageClassificator: MachineLearningDelegate {
    
}

