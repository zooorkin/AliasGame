//
//  AboutViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, IAboutPresenterDelegate {

    private let presentationAssembly: IPresentationAssembly

    private var presenter: IAboutPresenter


    init(presentationAssembly: IPresentationAssembly, presenter: IAboutPresenter) {
        self.presentationAssembly = presentationAssembly
        self.presenter = presenter
        super.init(nibName: "AboutViewController", bundle: nil)
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
