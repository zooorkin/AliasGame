//
//  ArrayHelper.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 29/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

extension Array where Array.Element: Hashable {
    func uniqueElements() -> [Element] {
        var uniqueElements: [Element] = []
        for element in self {
            if !uniqueElements.contains(element) {
                uniqueElements.append(element)
            }
        }
        return uniqueElements
    }
}
