//
//  PlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IPlayPresenter {

    var coordinator: IPlayCoordinator? { get set }

    var delegate: IPlayPresenterDelegate? { get set }
    
    func exitTapped()

}

protocol IPlayPresenterDelegate: class {

}

protocol IPlayCoordinator: class {
    
    func exitFromPlayModule()

}

class PlayPresenter: IPlayPresenter, IPlayModelDelegate {

    weak var coordinator: IPlayCoordinator?

    weak var delegate: IPlayPresenterDelegate?

    private var model: IPlayModel


    init(model: IPlayModel) {
        self.model = model
    }
    
    func exitTapped() {
        if let coordinator = coordinator {
            coordinator.exitFromPlayModule()
        } else {
            print("[PlayPresenter]: coordinator is nil")
        }
    }

}
