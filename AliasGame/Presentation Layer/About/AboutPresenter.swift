//
//  AboutPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

@objc protocol IAboutPresenter {

    var coordinator: IAboutCoordinator? { get set }

    var delegate: IAboutPresenterDelegate? { get set }
    
    func exitTapped()

}

@objc protocol IAboutPresenterDelegate {

}

@objc protocol IAboutCoordinator {
    
    func exitFromAboutModule()

}

class AboutPresenter: IAboutPresenter, IAboutModelDelegate {

    weak var coordinator: IAboutCoordinator?

    weak var delegate: IAboutPresenterDelegate?

    private var model: IAboutModel


    init(model: IAboutModel) {
        self.model = model
    }
    
    func exitTapped() {
        if let coordinator = coordinator {
            coordinator.exitFromAboutModule()
        } else {
            #if DEBUG
            debugPrint("[AboutPresenter]: coordinator is nil")
            #endif
        }
    }

}
