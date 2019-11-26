//
//  ServicesAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ServicesAssemblyProtocol {
    
    init(coreAssembly: CoreAssemblyProtocol)
    
    var wordsService: IWordsService { get }
    
    var imageService: IImageService { get }
    
    var translateService: ITranslateService { get }
    
    var recognizerService: IRecognizerService { get }
    
}

class ServicesAssembly: ServicesAssemblyProtocol {

    private var coreAssembly: CoreAssemblyProtocol


    required init(coreAssembly: CoreAssemblyProtocol) {
        self.coreAssembly = coreAssembly
    }


    lazy var wordsService: IWordsService =  {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return WordsService(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()

    lazy var imageService: IImageService =  {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return ImageService(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()

    lazy var translateService: ITranslateService =  {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return TranslateService(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()

    lazy var recognizerService: IRecognizerService =  {
        let networking = coreAssembly.networking
        let machineLearning = coreAssembly.machineLearning
        let coreDataStack = coreAssembly.coreDataStack
        return RecognizerService(networking: networking, machineLearning: machineLearning, coreDataStack: coreDataStack)
    }()


}
