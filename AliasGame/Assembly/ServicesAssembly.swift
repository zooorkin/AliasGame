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
        return WordsProvider(networking: networking)
    }()

    lazy var imageProvider: ImageProviderProtocol = {
        let networking = coreAssembly.networking
        return ImageProvider(networking: networking)
    }()

    lazy var translater: TranslaterProtocol = {
        let networking = coreAssembly.networking
        return Translater(networking: networking)
    }()

    lazy var imageClassificator: ImageClassificatorProtocol = {
        let machineLearning = coreAssembly.machineLearning
        return ImageClassificator(machineLearning: machineLearning)
    }()
    
    lazy var gameDataSaver: GameDataSaverProtocol = {
        let coreDataStack = coreAssembly.coreDataStack
        return GameDataSaver(coreDataStack: coreDataStack)
    }()
    
    lazy var gameDataProvider: GameDataProviderProtocol = {
        let coreDataStack = coreAssembly.coreDataStack
        return GameDataProvider(coreDataStack: coreDataStack)
    }()


}
