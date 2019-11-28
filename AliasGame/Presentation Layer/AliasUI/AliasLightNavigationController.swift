//
//  AliasLightNavigationController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 27/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasLightNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.setBackgroundImage(.init(), for: .default)
        navigationBar.shadowImage = .init()
        navigationBar.tintColor = .black
        navigationBar.isTranslucent = true
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

}
