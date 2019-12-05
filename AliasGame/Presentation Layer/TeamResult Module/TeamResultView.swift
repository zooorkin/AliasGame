//
//  TeamResultView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class TeamResultView: UIViewController {
    
    lazy var singleScreenView = SingleScreenView()
    
    private let presenter: TeamResultPresenterInput
    
    
    init(presenter: TeamResultPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .white
        view.addSubview(singleScreenView)
        singleScreenView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        presenter.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        singleScreenView.frame = view.bounds.inset(by: view.safeAreaInsets)
    }
    
    @objc func buttonTapped() {
        presenter.buttonTapped()
    }

}

extension TeamResultView: TeamResultPresenterOutput {
    
    func setTeamResult(score: Int, emoji: String, text: String) {
        let title = "Результат: \(score)"
        let customView = FifthView(emoji: emoji)
        let model = SingleScreenModel(title: title, text: text, color: .black, buttonTitle: "Далее")
        DispatchQueue.main.async {
            self.singleScreenView.loadModel(model: model)
            self.singleScreenView.loadCustomView(customView: customView)
            self.singleScreenView.layoutSubviews()
        }
    }
    
}


