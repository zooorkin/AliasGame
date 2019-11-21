//
//  AboutModel.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IAboutModel {

    var delegate: IAboutModelDelegate? { get set }

}

protocol IAboutModelDelegate: class {

}

class AboutModel: IAboutModel, IWordsServiceDelegate, IImageServiceDelegate, ITranslateServiceDelegate, IRecognizerServiceDelegate {

    weak var delegate: IAboutModelDelegate?

    private var wordsService: IWordsService

    private var imageService: IImageService

    private var translateService: ITranslateService

    private var recognizerService: IRecognizerService


    init(wordsService: IWordsService, imageService: IImageService, translateService: ITranslateService, recognizerService: IRecognizerService) {
        self.wordsService = wordsService
        self.imageService = imageService
        self.translateService = translateService
        self.recognizerService = recognizerService
        self.wordsService.delegate = self
        self.imageService.delegate = self
        self.translateService.delegate = self
        self.recognizerService.delegate = self
    }

}
