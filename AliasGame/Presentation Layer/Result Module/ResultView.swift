//
//  ResultView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class ResultView: UIViewController {
    
    let button = UIButton(frame: .zero)
    
    private let presenter: ResultPresenterInput
    
    
    init(presenter: ResultPresenterInput) {
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
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.frame = CGRect(origin: .zero, size: button.intrinsicContentSize)
        button.center = view.center
    }
    
    @objc func buttonTapped() {
        presenter.buttonTapped()
    }

}

extension ResultView: ResultPresenterOutput {
    
}


