//
//  RandomWordAPI.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 29/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class RandomWordAPI {
    
    static let getKeyURL = "https://random-word-api.herokuapp.com/key?"
    
    private static let baseGetWordsURL = "https://random-word-api.herokuapp.com/word"

    static func getWordsURL(key: String, number: Int) -> URL? {
        guard var components = URLComponents(string: baseGetWordsURL) else {
            return nil
        }
        let keyItem = URLQueryItem(name: "key", value: key)
        let numberItem = URLQueryItem(name: "number", value: String(number))
        components.queryItems = [keyItem, numberItem]
        return components.url
    }
    
}
