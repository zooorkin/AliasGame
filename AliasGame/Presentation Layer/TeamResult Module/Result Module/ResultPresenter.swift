//
//  ResultPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 06/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol ResultPresenterInput {
    
    func buttonTapped()
    
    func viewDidLoad()
    
}

protocol ResultPresenterOutput: class {
    
    func setResult(title: String, emoji: String, text: String, buttonTitle: String)
    
}

protocol ResultRouterInput: class {
    
    func exitFromResultModule()
    
}

class ResultPresenter: ResultPresenterInput {
    
    weak var router: ResultRouterInput?
    
    weak var output: ResultPresenterOutput?
    
    let title: String
    
    let emoji: String
    
    let text: String
    
    let buttonTitle: String
    
    let completion: () -> Void
    
    init(title: String, emoji: String, text: String, buttonTitle: String, completion: @escaping () -> Void) {
        self.title = title
        self.emoji = emoji
        self.text = text
        self.buttonTitle = buttonTitle
        self.completion = completion
    }
    
    
    func buttonTapped() {
        completion()
    }
    
    func viewDidLoad() {
        guard let output = output else {
            debugPrint("[ResultPresenter]: output is nil")
            return
        }
        output.setResult(title: title, emoji: emoji, text: text, buttonTitle: buttonTitle)
    }
    
}
