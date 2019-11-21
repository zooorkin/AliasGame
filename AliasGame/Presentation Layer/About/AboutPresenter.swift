//
//  AboutPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IAboutPresenter {

    var coordinator: IAboutCoordinator? { get set }

    var delegate: IAboutPresenterDelegate? { get set }
    
    func exitTapped()

}

protocol IAboutPresenterDelegate: class {

}

protocol IAboutCoordinator: class {
    
    func exitFromAboutModule()

}

class AboutPresenter: IAboutPresenter, IAboutModelDelegate {

    public weak var coordinator: IAboutCoordinator?

    public weak var delegate: IAboutPresenterDelegate?

    private var model: IAboutModel


    init(model: IAboutModel) {
        self.model = model
    }
    
    func exitTapped() {
        if let coordinator = coordinator {
            coordinator.exitFromAboutModule()
        } else {
            print("[AboutPresenter]: coordinator is nil")
        }
    }

}
