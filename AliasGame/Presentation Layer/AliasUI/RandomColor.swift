//
//  RandomColor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 28/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

func getRandomColor() -> UIColor {
    func randomValue() -> CGFloat {
        let random = Int(arc4random()) / 3
        let max = Int(Int32.max)
        return CGFloat(integerLiteral: random) / CGFloat(integerLiteral: max)
    }
    let red = randomValue()
    let green = randomValue()
    let blue = randomValue()
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
}
