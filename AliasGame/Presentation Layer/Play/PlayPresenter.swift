//
//  PlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

@objc protocol IPlayPresenter {

    var coordinator: IPlayCoordinator? { get set }

    var delegate: IPlayPresenterDelegate? { get set }
    
    func exitTapped()

}

@objc protocol IPlayPresenterDelegate {

}

@objc protocol IPlayCoordinator {
    
    func exitFromPlayModule()

}

class PlayPresenter: IPlayPresenter, IPlayModelDelegate {

    weak var coordinator: IPlayCoordinator?

    weak var delegate: IPlayPresenterDelegate?

    private var model: IPlayModel


    init(model: IPlayModel) {
        self.model = model
    }
    
    @objc func exitTapped() {
        if let coordinator = coordinator {
            coordinator.exitFromPlayModule()
        } else {
            #if DEBUG
            debugPrint("[PlayPresenter]: coordinator is nil")
            #endif
        }
    }

}
