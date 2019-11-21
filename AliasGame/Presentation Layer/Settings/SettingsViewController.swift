//
//  SettingsViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, ISettingsPresenterDelegate {

    private let presentationAssembly: IPresentationAssembly

    private var presenter: ISettingsPresenter


    init(presentationAssembly: IPresentationAssembly, presenter: ISettingsPresenter) {
        self.presentationAssembly = presentationAssembly
        self.presenter = presenter
        super.init(nibName: "SettingsViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func exitButtonTapped(_ sender: UIButton) {
        presenter.exitTapped()
    }
    
}
