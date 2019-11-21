//
//  MachineLearning.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IMachineLearning {

    var delegate: IMachineLearningDelegate? { get set }

}


protocol IMachineLearningDelegate {

}


class MachineLearning: IMachineLearning {

    var delegate: IMachineLearningDelegate?

}
