//
//  AboutView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AboutView: AliasDarkViewController {
    
    
    private var presenter: AboutPresenterInput
    
    init(presenter: AboutPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Об игре"
        plainView.addSubview(textView)
        textView.font = .systemFont(ofSize: 17.0, weight: .regular)
        textView.textColor = .black
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.frame = plainView.bounds.insetBy(dx: 8, dy: 8)
    }
    
    let textView = UITextView(frame: .zero)
    
}


extension AboutView: AboutPresenterOutput {
    
    func setText(text: String) {
        DispatchQueue.main.async {
            self.textView.text = text
            self.viewDidLayoutSubviews()
        }
    }
    
    func setTitle(title: String) {
        DispatchQueue.main.async {
            self.title = title
        }
    }
    
}
