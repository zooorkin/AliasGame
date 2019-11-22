//
//  StartPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IStartPresenter {

    var coordinator: IStartCoordinator? { get set }

    var delegate: IStartPresenterDelegate? { get set }
    
    func playButtonTapped()

    func recordsButtonTapped()
    
    func settingsButtonTapped()
    
    func aboutGameButtonTapped()
    
    func reservedButtonTapped()
    
}

protocol IStartPresenterDelegate: class {

}

protocol IStartCoordinator: class {
    
    func play()
    
    func records()
    
    func settings()
    
    func aboutGame()
    
}

class StartPresenter: IStartPresenter, IStartModelDelegate {

    weak var coordinator: IStartCoordinator?

    weak var delegate: IStartPresenterDelegate?

    private var model: IStartModel


    init(model: IStartModel) {
        self.model = model
    }
    
    func playButtonTapped() {
        if let coordinator = coordinator {
            coordinator.play()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: coordinator is nil")
            #endif
        }
    }
    
    func recordsButtonTapped() {
        if let coordinator = coordinator {
            coordinator.records()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: coordinator is nil")
            #endif
        }
    }
    
    func settingsButtonTapped() {
        if let coordinator = coordinator {
            coordinator.settings()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: coordinator is nil")
            #endif
        }
    }
    
    func aboutGameButtonTapped() {
        if let coordinator = coordinator {
            coordinator.aboutGame()
        } else {
            #if DEBUG
            debugPrint("[StartPresenter]: coordinator is nil")
            #endif
        }
    }
    
    func reservedButtonTapped() {
        #if DEBUG
        debugPrint("[StartPresenter]: function reservedButtonTapped not implemented")
        #endif
    }

}
