//
//  ServicesAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ServicesAssemblyProtocol {
    
    init(coreAssembly: CoreAssemblyProtocol)
    
    var wordsProvider: WordsProviderProtocol { get }
    
    var imageProvider: ImageProviderProtocol { get }
    
    var translater: TranslaterProtocol { get }
    
    var imageClassificator: ImageClassificatorProtocol { get }
    
    var gameDataSaver: GameDataSaverProtocol { get }
    
    var gameDataProvider: GameDataProviderProtocol { get }
    
}

class ServicesAssembly: ServicesAssemblyProtocol {

    private var coreAssembly: CoreAssemblyProtocol


    required init(coreAssembly: CoreAssemblyProtocol) {
        self.coreAssembly = coreAssembly
    }


    lazy var wordsProvider: WordsProviderProtocol = {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return WordsProvider(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()

    lazy var imageProvider: ImageProviderProtocol = {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return ImageProvider(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()

    lazy var translater: TranslaterProtocol = {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return Translater(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()

    lazy var imageClassificator: ImageClassificatorProtocol = {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return ImageClassificator(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()
    
    lazy var gameDataSaver: GameDataSaverProtocol = {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return GameDataSaver(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()
    
    lazy var gameDataProvider: GameDataProviderProtocol = {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return GameDataProvider(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()


}
