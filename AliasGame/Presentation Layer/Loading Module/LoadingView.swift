//
//  LoadingView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class LoadingView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingIndicator)
        view.backgroundColor = .white
        loadingIndicator.color = .black
        loadingIndicator.startAnimating()
        loadingIndicator.style = .gray
    }
    
    let loadingIndicator = UIActivityIndicatorView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loadingIndicator.frame = CGRect(origin: .zero, size: loadingIndicator.intrinsicContentSize)
        loadingIndicator.center = view.center
    }
    
}
