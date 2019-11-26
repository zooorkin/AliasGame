//
//  RecordsInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol RecordsInteractorInput {
    
    var output: RecordsInteractorOutput? { get set }
    
}

protocol RecordsInteractorOutput: class {
    
}

class RecordsInteractor: RecordsInteractorInput {
    
    weak var output: RecordsInteractorOutput?
    
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

extension RecordsInteractor: IWordsServiceDelegate {
    
}

extension RecordsInteractor: IImageServiceDelegate {
    
}

extension RecordsInteractor: ITranslateServiceDelegate {
    
}

extension RecordsInteractor: IRecognizerServiceDelegate {
    
}
