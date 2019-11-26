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
    
    private var gameDataProvider: GameDataProviderProtocol
    
    
    init(gameDataProvider: GameDataProviderProtocol) {
        self.gameDataProvider = gameDataProvider
        self.gameDataProvider.delegate = self
    }
    
}

extension RecordsInteractor: GameDataProviderDelegate {
    
}
