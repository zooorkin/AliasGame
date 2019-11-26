//
//  WordsProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol WordsProviderProtocol {

    var delegate: WordsProviderDelegate? { get set }

}


protocol WordsProviderDelegate {

}


class WordsProvider: WordsProviderProtocol {

    var delegate: WordsProviderDelegate?

    private var networking: NetworkingProtocol

    init(networking: NetworkingProtocol) {
        self.networking = networking
        self.networking.delegate = self
    }

}

extension WordsProvider: NetworkingDelegate {
    
}

