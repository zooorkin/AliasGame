//
//  ReservedViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class ReservedViewController: UIViewController, IReservedPresenterDelegate {

    private let presentationAssembly: IPresentationAssembly

    private var presenter: IReservedPresenter


    init(presentationAssembly: IPresentationAssembly, presenter: IReservedPresenter) {
        self.presentationAssembly = presentationAssembly
        self.presenter = presenter
        super.init(nibName: "ReservedViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
