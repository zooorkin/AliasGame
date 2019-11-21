//
//  CoreAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

class CoreAssembly: ICoreAssembly {

    lazy var networking: INetworking = Networking()

    lazy var machineLearning: IMachineLearning = MachineLearning()

    lazy var coreDataStack: ICoreDataStack = CoreDataStack()

}
