//
//  TranslateService.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol TranslaterProtocol {

    var delegate: TranslaterDelegate? { get set }

}


protocol TranslaterDelegate {

}


class Translater: TranslaterProtocol {

    var delegate: TranslaterDelegate?

    private var networking: NetworkingProtocol

    init(networking: NetworkingProtocol) {
        self.networking = networking
        self.networking.delegate = self
    }

}

extension Translater: NetworkingDelegate {
    
}
