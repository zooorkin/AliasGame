//
//  MachineLearning.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol MachineLearningProtocol {

    var delegate: MachineLearningDelegate? { get set }

}


protocol MachineLearningDelegate {

}


class MachineLearning: MachineLearningProtocol {

    var delegate: MachineLearningDelegate?

}
