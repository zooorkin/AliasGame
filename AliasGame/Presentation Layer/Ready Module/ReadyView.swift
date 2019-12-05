//
//  ReadyView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class ReadyView: UIViewController {

    lazy var singleScreenView = SingleScreenView()
    
    private let presenter: ReadyPresenterInput
    
    
    init(presenter: ReadyPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        singleScreenView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        disableButton()
        navigationItem.hidesBackButton = true
        view.addSubview(singleScreenView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        singleScreenView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }
    
    @objc func buttonTapped() {
        presenter.buttonTapped()
    }
    
    func setConfiguration(_ configuration: AliasGameConfiguration, nextTeam: Int) {
        let text = "Начинает \(configuration.mode.teamType) \(nextTeam + 1)"
        let model = SingleScreenModel(title: "Приготовьтесь", text: text, color: .black, buttonTitle: "Начать")
        singleScreenView.loadModel(model: model)
        singleScreenView.loadCustimView(customView: FifthView(emoji: "🚀"))
    }
    
}

extension ReadyView: ReadyPresenterOutput {
    
    func enableButton() {
        singleScreenView.enableButton()
        
    }
    
    func disableButton() {
        singleScreenView.disableButton()
    }
    
}
