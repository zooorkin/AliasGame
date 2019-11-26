//
//  ImageProvider.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ImageProviderProtocol {

    var delegate: ImageProviderDelegate? { get set }

}


protocol ImageProviderDelegate {

}


class ImageProvider: ImageProviderProtocol {
    
    var delegate: ImageProviderDelegate?

    private var networking: NetworkingProtocol

    init(networking: NetworkingProtocol) {
        self.networking = networking
        self.networking.delegate = self
    }

}

extension ImageProvider: NetworkingDelegate {
    
}
