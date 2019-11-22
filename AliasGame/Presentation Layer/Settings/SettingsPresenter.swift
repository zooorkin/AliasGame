//
//  SettingsPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

@objc protocol ISettingsPresenter {

    var coordinator: ISettingsCoordinator? { get set }

    var delegate: ISettingsPresenterDelegate? { get set }
    
    func exitTapped()

}

@objc protocol ISettingsPresenterDelegate {

}

@objc protocol ISettingsCoordinator {
    
    func exitFromSettingsModule()

}

class SettingsPresenter: ISettingsPresenter, ISettingsModelDelegate {

    weak var coordinator: ISettingsCoordinator?

    weak var delegate: ISettingsPresenterDelegate?

    private var model: ISettingsModel


    init(model: ISettingsModel) {
        self.model = model
    }
    
    func exitTapped() {
        if let coordinator = coordinator {
            coordinator.exitFromSettingsModule()
        } else {
            #if DEBUG
            debugPrint("[SettingsPresenter]: coordinator is nil")
            #endif
        }
    }

}
