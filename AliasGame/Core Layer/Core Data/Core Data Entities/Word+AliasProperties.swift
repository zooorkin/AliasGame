//
//  Word+AliasProperties.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 01/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

extension Word {
    
    enum Language: Int32 {
        
        case russian = 0
        
        case english = 1
        
        case deutsch = 2
        
        case unknown = -1
        
    }
    
    enum Category: Int32 {
        
        case noun = 0
        
        case verb = 1
        
        case adjective = 2
        
        case any = 3
        
        case presentation = 4
        
        case unknown = -1
        
    }
    
    var language: Language {
        return Language(rawValue: languageData) ?? .unknown
    }
    
    var category: Category {
        return Category(rawValue: categoryData) ?? .unknown
    }
    
    var word: String {
        return wordData ?? ""
    }
    
}
