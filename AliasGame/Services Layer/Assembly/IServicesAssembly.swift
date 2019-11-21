//
//  IServicesAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IServicesAssembly {

    init(coreAssembly: ICoreAssembly)

    var wordsService: IWordsService { get }

    var imageService: IImageService { get }

    var translateService: ITranslateService { get }

    var recognizerService: IRecognizerService { get }

}
