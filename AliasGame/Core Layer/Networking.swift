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

    func getData(at path: URL, completion: @escaping (Data?) -> Void)
    
}


protocol NetworkingDelegate: class {

}


class Networking: NetworkingProtocol {

    weak var delegate: NetworkingDelegate?
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func getData(at path: URL, completion: @escaping (Data?) -> Void) {
        let dataTask = session.dataTask(with: path) { data, _, _ in
            completion(data)
        }
        dataTask.resume()
    }

}
