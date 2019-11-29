//
//  StringHelper.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 29/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

extension String {
    func uppercasedFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.dropFirst().lowercased()
    }
}
