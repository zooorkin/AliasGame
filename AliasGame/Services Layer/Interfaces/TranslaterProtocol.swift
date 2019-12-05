//
//  TranslaterProtocol.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 05/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol TranslaterProtocol {
    
    func translate(englishWord: String, completion: @escaping (Result<String, Error>) -> Void)
    
}
