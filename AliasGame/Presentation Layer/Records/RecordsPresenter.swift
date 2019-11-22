//
//  RecordsPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IRecordsPresenter {

    var coordinator: IRecordsCoordinator? { get set }

    var delegate: IRecordsPresenterDelegate? { get set }
    
    func exitTapped()

}

protocol IRecordsPresenterDelegate: class {

}

protocol IRecordsCoordinator: class {
    
    func exitFromRecordsModule()

}

class RecordsPresenter: IRecordsPresenter, IRecordsModelDelegate {

    weak var coordinator: IRecordsCoordinator?

    weak var delegate: IRecordsPresenterDelegate?

    private var model: IRecordsModel


    init(model: IRecordsModel) {
        self.model = model
    }
    
    func exitTapped() {
        if let coordinator = coordinator {
            coordinator.exitFromRecordsModule()
        } else {
            print("[RecordsPresenter]: coordinator is nil")
        }
    }

}
