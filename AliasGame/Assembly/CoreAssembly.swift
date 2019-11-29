//
//  CoreAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol CoreAssemblyProtocol {
    
    var networking: NetworkingProtocol { get }
    
    var machineLearning: MachineLearningProtocol { get }
    
    var coreDataStack: CoreDataStackProtocol { get }
    
}

class CoreAssembly: CoreAssemblyProtocol {

    lazy var networking: NetworkingProtocol = Networking(session: URLSession.shared)

    lazy var machineLearning: MachineLearningProtocol = MachineLearning()

    lazy var coreDataStack: CoreDataStackProtocol = CoreDataStack()

}
