//
//  ReservedPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IReservedPresenter {

    var coordinator: IReservedCoordinator? { get set }

    var delegate: IReservedPresenterDelegate? { get set }

}

protocol IReservedPresenterDelegate: class {

}

protocol IReservedCoordinator: class {

}

class ReservedPresenter: IReservedPresenter, IReservedModelDelegate {

    public weak var coordinator: IReservedCoordinator?

    public weak var delegate: IReservedPresenterDelegate?

    private var model: IReservedModel


    init(model: IReservedModel) {
        self.model = model
    }

}
