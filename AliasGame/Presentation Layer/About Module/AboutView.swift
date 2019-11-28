//
//  AboutView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AboutView: AliasDarkViewController {
    
    
    private var presenter: AboutPresenterInput
    
    let closeBarButtonItem: UIBarButtonItem
    
    
    init(presenter: AboutPresenterInput) {
        self.presenter = presenter
        closeBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeBarButtonItem.target = self
        closeBarButtonItem.action = #selector(closeBarButtonTapped)
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = closeBarButtonItem
        title = "Об игре"
    }
    
    @objc func closeBarButtonTapped() {
        presenter.exitTapped()
    }
    
}


extension AboutView: AboutPresenterOutput {
    
}
