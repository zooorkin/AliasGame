//
//  MockTranslater.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class MockTranslater: TranslaterProtocol {
    
    func translate(englishWord: String, completion: @escaping (Result<String, Error>) -> Void){
        completion(.success("Перевод"))
    }
    
}
