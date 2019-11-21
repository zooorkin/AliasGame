//
//  RecordsViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController, IRecordsPresenterDelegate {

    private let presentationAssembly: IPresentationAssembly

    private var presenter: IRecordsPresenter


    init(presentationAssembly: IPresentationAssembly, presenter: IRecordsPresenter) {
        self.presentationAssembly = presentationAssembly
        self.presenter = presenter
        super.init(nibName: "RecordsViewController", bundle: nil)
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
