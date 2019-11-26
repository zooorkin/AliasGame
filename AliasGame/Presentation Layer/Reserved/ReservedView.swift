//
//  ReservedView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class ReservedView: UIViewController {
    
    let label: UILabel
    let exitButton: UIButton
    
    private var presenter: ReservedPresenterInput
    
    
    init(presenter: ReservedPresenterInput) {
        self.presenter = presenter
        self.label = UILabel(frame: .zero)
        self.exitButton = UIButton(type: .system)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // View
        view.backgroundColor = .white
        
        // Label
        view.addSubview(label)
        label.text = "Reserved"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        let labelIntrinsicContentSize = label.intrinsicContentSize
        label.frame = CGRect(origin: .zero, size: labelIntrinsicContentSize)
        
        // Exit button
        view.addSubview(exitButton)
        exitButton.setTitle("Выход", for: .normal)
        exitButton.addTarget(presenter, action: #selector(ReservedPresenterInput.exitTapped), for: .touchUpInside)
        let exitButtonIntrinsicContentSize = exitButton.intrinsicContentSize
        exitButton.frame = CGRect(origin: .zero, size: exitButtonIntrinsicContentSize)
    }
    
    override func viewWillLayoutSubviews() {
        label.center = view.center
        exitButton.center = CGPoint(x: label.center.x, y: label.frame.maxY + 16.0 + exitButton.frame.height / 2)
    }
    
}


extension ReservedView: ReservedPresenterOutput {
    
}
