//
//  Networking.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol NetworkingProtocol {

    var delegate: NetworkingDelegate? { get set }
    
    var session: URLSession { get }

}


protocol NetworkingDelegate {

}


class Networking: NetworkingProtocol {

    var delegate: NetworkingDelegate?
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }

}
