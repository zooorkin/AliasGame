//
//  Networking.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol INetworking {

    var delegate: INetworkingDelegate? { get set }

}


protocol INetworkingDelegate {

}


class Networking: INetworking {

    var delegate: INetworkingDelegate?

}
