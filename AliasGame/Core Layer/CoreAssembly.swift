//
//  CoreAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol CoreAssemblyProtocol {
    
    var networking: INetworking { get }
    
    var machineLearning: IMachineLearning { get }
    
    var coreDataStack: ICoreDataStack { get }
    
}

class CoreAssembly: CoreAssemblyProtocol {

    lazy var networking: INetworking = Networking()

    lazy var machineLearning: IMachineLearning = MachineLearning()

    lazy var coreDataStack: ICoreDataStack = CoreDataStack()

}
