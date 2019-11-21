//
//  PlayViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, IPlayPresenterDelegate {

    private let presentationAssembly: IPresentationAssembly

    private var presenter: IPlayPresenter


    init(presentationAssembly: IPresentationAssembly, presenter: IPlayPresenter) {
        self.presentationAssembly = presentationAssembly
        self.presenter = presenter
        super.init(nibName: "PlayViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func exitTapped(_ sender: UIButton) {
        presenter.exitTapped()
    }
    
}
