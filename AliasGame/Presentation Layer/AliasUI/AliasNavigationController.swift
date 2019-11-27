//
//  AliasNavigationController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 27/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.setBackgroundImage(.init(), for: .default)
        navigationBar.shadowImage = .init()
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = true
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        // #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
