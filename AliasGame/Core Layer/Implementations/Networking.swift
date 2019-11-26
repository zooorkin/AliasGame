//
//  Networking.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol NetworkingProtocol {

    var delegate: NetworkingDelegate? { get set }

}


protocol NetworkingDelegate {

}


class Networking: NetworkingProtocol {

    var delegate: NetworkingDelegate?

}
