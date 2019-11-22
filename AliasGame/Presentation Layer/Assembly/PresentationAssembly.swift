//
//  PresentationAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class PresentationAssembly: IPresentationAssembly {

    var coordinator: ICoordinator?
    
    var coordinatorViewController: UIViewController? {
        if let coordinator = coordinator {
            return coordinator.viewController
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
            return nil
        }
    }

    private var servicesAssembly: IServicesAssembly


    required init(servicesAssembly: IServicesAssembly) {
        self.servicesAssembly = servicesAssembly
    }


    func navigationController(rootViewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: rootViewController)
    }

    func startViewController() -> StartViewController {
        let wordsService = servicesAssembly.wordsService
        let imageService = servicesAssembly.imageService
        let translateService = servicesAssembly.translateService
        let recognizerService = servicesAssembly.recognizerService

        let model = StartModel(wordsService: wordsService, imageService: imageService, translateService: translateService, recognizerService: recognizerService)
        let presenter = StartPresenter(model: model)
        let view = StartViewController(presentationAssembly: self, presenter: presenter)

        model.delegate = presenter
        presenter.delegate = view

        if let coordinator = coordinator {
            if let coordinator = coordinator as? IStartCoordinator {
                presenter.coordinator = coordinator
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: coordinator не поддерживает маршрутизацию IStartCoordinator")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
        }
        return view
    }

    func playViewController() -> PlayViewController {
        let wordsService = servicesAssembly.wordsService
        let imageService = servicesAssembly.imageService
        let translateService = servicesAssembly.translateService
        let recognizerService = servicesAssembly.recognizerService

        let model = PlayModel(wordsService: wordsService, imageService: imageService, translateService: translateService, recognizerService: recognizerService)
        let presenter = PlayPresenter(model: model)
        let view = PlayViewController(presentationAssembly: self, presenter: presenter)

        model.delegate = presenter
        presenter.delegate = view

        if let coordinator = coordinator {
            if let coordinator = coordinator as? IPlayCoordinator {
                presenter.coordinator = coordinator
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: coordinator не поддерживает маршрутизацию IPlayCoordinator")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
        }
        return view
    }

    func recordsViewController() -> RecordsViewController {
        let wordsService = servicesAssembly.wordsService
        let imageService = servicesAssembly.imageService
        let translateService = servicesAssembly.translateService
        let recognizerService = servicesAssembly.recognizerService

        let model = RecordsModel(wordsService: wordsService, imageService: imageService, translateService: translateService, recognizerService: recognizerService)
        let presenter = RecordsPresenter(model: model)
        let view = RecordsViewController(presentationAssembly: self, presenter: presenter)

        model.delegate = presenter
        presenter.delegate = view

        if let coordinator = coordinator {
            if let coordinator = coordinator as? IRecordsCoordinator {
                presenter.coordinator = coordinator
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: coordinator не поддерживает маршрутизацию IRecordsCoordinator")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
        }
        return view
    }

    func settingsViewController() -> SettingsViewController {
        let wordsService = servicesAssembly.wordsService
        let imageService = servicesAssembly.imageService
        let translateService = servicesAssembly.translateService
        let recognizerService = servicesAssembly.recognizerService

        let model = SettingsModel(wordsService: wordsService, imageService: imageService, translateService: translateService, recognizerService: recognizerService)
        let presenter = SettingsPresenter(model: model)
        let view = SettingsViewController(presentationAssembly: self, presenter: presenter)

        model.delegate = presenter
        presenter.delegate = view

        if let coordinator = coordinator {
            if let coordinator = coordinator as? ISettingsCoordinator {
                presenter.coordinator = coordinator
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: coordinator не поддерживает маршрутизацию ISettingsCoordinator")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
        }
        return view
    }

    func aboutViewController() -> AboutViewController {
        let wordsService = servicesAssembly.wordsService
        let imageService = servicesAssembly.imageService
        let translateService = servicesAssembly.translateService
        let recognizerService = servicesAssembly.recognizerService

        let model = AboutModel(wordsService: wordsService, imageService: imageService, translateService: translateService, recognizerService: recognizerService)
        let presenter = AboutPresenter(model: model)
        let view = AboutViewController(presentationAssembly: self, presenter: presenter)

        model.delegate = presenter
        presenter.delegate = view

        if let coordinator = coordinator {
            if let coordinator = coordinator as? IAboutCoordinator {
                presenter.coordinator = coordinator
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: coordinator не поддерживает маршрутизацию IAboutCoordinator")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
        }
        return view
    }

    func reservedViewController() -> ReservedViewController {
        let wordsService = servicesAssembly.wordsService
        let imageService = servicesAssembly.imageService
        let translateService = servicesAssembly.translateService
        let recognizerService = servicesAssembly.recognizerService

        let model = ReservedModel(wordsService: wordsService, imageService: imageService, translateService: translateService, recognizerService: recognizerService)
        let presenter = ReservedPresenter(model: model)
        let view = ReservedViewController(presentationAssembly: self, presenter: presenter)

        model.delegate = presenter
        presenter.delegate = view

        if let coordinator = coordinator {
            if let coordinator = coordinator as? IReservedCoordinator {
                presenter.coordinator = coordinator
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: coordinator не поддерживает маршрутизацию IReservedCoordinator")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: coordinator не задан")
            #endif
        }
        return view
    }

}
