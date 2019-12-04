//
//  ReadyView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class ReadyView: UIViewController {
    
    let loadingIndicator = UIActivityIndicatorView()
    
    let button = UIButton(frame: .zero)
    
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
        title = "Ready"
        view.backgroundColor = .white
        button.setTitle("Играть", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        view.backgroundColor = .white
        loadingIndicator.color = .black
        loadingIndicator.style = .gray
        view.addSubview(loadingIndicator)
        
        disableButton()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.frame = CGRect(origin: .zero, size: button.intrinsicContentSize)
        button.center = view.center
        
        loadingIndicator.frame = CGRect(origin: .zero, size: loadingIndicator.intrinsicContentSize)
        loadingIndicator.center = view.center
    }
    
    @objc func buttonTapped() {
        presenter.buttonTapped()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ReadyView: ReadyPresenterOutput {
    
    func enableButton() {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
            self.button.isHidden = false
            self.button.isEnabled = true
        }
        
    }
    
    func disableButton() {
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
            self.loadingIndicator.isHidden = false
            self.button.isHidden = true
            self.button.isEnabled = false
        }
    }
    
}
