//
//  StartViewController.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, IStartPresenterDelegate {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordsButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var aboutGameButton: UIButton!
    @IBOutlet weak var reservedButton: UIButton!
    
    private let presentationAssembly: IPresentationAssembly

    private var presenter: IStartPresenter


    init(presentationAssembly: IPresentationAssembly, presenter: IStartPresenter) {
        self.presentationAssembly = presentationAssembly
        self.presenter = presenter
        super.init(nibName: "StartViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func playButtonTapped(_ sender: Any) {
        presenter.playButtonTapped()
    }
    
    @IBAction func recordsButtonTapped(_ sender: UIButton) {
        presenter.recordsButtonTapped()
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        presenter.settingsButtonTapped()
    }
    
    @IBAction func aboutGameButtonTapped(_ sender: UIButton) {
        presenter.aboutGameButtonTapped()
    }
    
    @IBAction func reservedButtonTapped(_ sender: UIButton) {
        presenter.reservedButtonTapped()
    }
    
}
