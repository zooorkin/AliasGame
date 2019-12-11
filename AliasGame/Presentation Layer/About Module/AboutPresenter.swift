//
//  AboutPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol AboutPresenterInput {
    
    var router: AboutRouterInput? { get set }
    
    var output: AboutPresenterOutput? { get set }
    
    func viewDidLoad()
    
}

protocol AboutPresenterOutput: class {
    
    func setText(text: String)
    
    func setTitle(title: String)
    
}

protocol AboutRouterInput: class {
    
    func exitFromAboutModule()
    
}

class AboutPresenter: AboutPresenterInput {
    
    weak var router: AboutRouterInput?
    
    weak var output: AboutPresenterOutput?
    
    private var interactor: AboutInteractorInput
    
    
    init(interactor: AboutInteractorInput) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        if let output = output {
            output.setTitle(title: interactor.title)
            output.setText(text: interactor.text)
        } else {
            debugPrint("[AboutPresenter]: output is nil")
        }
    }
    
}

extension AboutPresenter: AboutInteractorOutput {
    
}
