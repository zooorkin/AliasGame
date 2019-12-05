//
//  AliasDarkViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 27/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasDarkViewController: UIViewController {

    var aliasInsets: UIEdgeInsets {
        return UIEdgeInsets(top: view.safeAreaInsets.top, left: 8, bottom: view.safeAreaInsets.bottom + 8, right: 8)
    }
    
    let plainView = UIScrollView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        plainView.backgroundColor = .white
        plainView.layer.cornerRadius = 16.0
        view.addSubview(plainView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        plainView.frame = view.bounds
            .inset(by: aliasInsets)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
