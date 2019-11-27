//
//  PlayView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class PlayView: AliasViewController {

    
    private let presenter: PlayPresenterInput

    let stopBarButtonItem: UIBarButtonItem

    
    init(presenter: PlayPresenterInput) {
        self.presenter = presenter
        stopBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopBarButtonItem.target = self
        stopBarButtonItem.action = #selector(stopBarButtonTapped)
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = stopBarButtonItem
        title = "Играть"
    }
    
    @objc func stopBarButtonTapped() {
        presenter.exitTapped()
    }
    
}


extension PlayView: PlayPresenterOutput {
    
}
