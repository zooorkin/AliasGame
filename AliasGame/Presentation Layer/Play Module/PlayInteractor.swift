//
//  PlayInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol PlayInteractorInput {

    var output: PlayInteractorOutput? { get set }

}

protocol PlayInteractorOutput: class {

}

class PlayInteractor: PlayInteractorInput {

    weak var output: PlayInteractorOutput?

    private var wordsProvider: WordsProviderProtocol
    
    private var imageProvider: ImageProviderProtocol
    
    private var translater: TranslaterProtocol
    
    private var imageClassificator: ImageClassificatorProtocol
    
    private var gameDataSaver: GameDataSaverProtocol
    
    
    init(wordsProvider: WordsProviderProtocol, imageProvider: ImageProviderProtocol, translater: TranslaterProtocol, imageClassificator: ImageClassificatorProtocol, gameDataSaver: GameDataSaverProtocol) {
        self.wordsProvider = wordsProvider
        self.imageProvider = imageProvider
        self.translater = translater
        self.imageClassificator = imageClassificator
        self.gameDataSaver = gameDataSaver
        self.wordsProvider.delegate = self
        self.imageProvider.delegate = self
        self.imageClassificator.delegate = self
        self.gameDataSaver.delegate = self
    }
    
}

extension PlayInteractor: WordsProviderDelegate {
    
}

extension PlayInteractor: ImageProviderDelegate {
    
}

extension PlayInteractor: ImageClassificatorDelegate {
    
}

extension PlayInteractor: GameDataSaverDelegate {
    
}
