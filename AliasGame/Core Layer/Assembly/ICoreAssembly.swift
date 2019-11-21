//
//  ICoreAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ICoreAssembly {

    var networking: INetworking { get }

    var machineLearning: IMachineLearning { get }

    var coreDataStack: ICoreDataStack { get }

}
