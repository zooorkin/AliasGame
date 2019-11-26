//
//  PresentationAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol PresentationAssemblyProtocol {
    
    var router: RouterInput? { get set }
    
    var routerViewController: UIViewController? { get }
    
    
    init(servicesAssembly: ServicesAssemblyProtocol)
    
    
    func navigationController(rootViewController: UIViewController) -> UINavigationController
    
    func startModule() -> StartView
    
    func playModule() -> PlayView
    
    func recordsModule() -> RecordsView
    
    func settingsModule() -> SettingsView
    
    func aboutModule() -> AboutView
    
    func reservedModule() -> ReservedView
    
}

class PresentationAssembly: PresentationAssemblyProtocol {

    var router: RouterInput?
    
    var routerViewController: UIViewController? {
        if let router = router {
            return router.viewController
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
            return nil
        }
    }

    private var servicesAssembly: ServicesAssemblyProtocol


    required init(servicesAssembly: ServicesAssemblyProtocol) {
        self.servicesAssembly = servicesAssembly
    }


    func navigationController(rootViewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: rootViewController)
    }

    func startModule() -> StartView {
        let interactor = StartInteractor()
        let presenter = StartPresenter(interactor: interactor)
        let view = StartView(presenter: presenter)

        interactor.output = presenter
        presenter.output = view

        if let router = router {
            if let router = router as? StartRouterInput {
                presenter.router = router
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: router не поддерживает маршрутизацию StartRouterInput")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
        }
        return view
    }

    func playModule() -> PlayView {
        let wordsProvider = servicesAssembly.wordsProvider
        let imageProvider = servicesAssembly.imageProvider
        let translater = servicesAssembly.translater
        let imageClassificator = servicesAssembly.imageClassificator
        let gameDataSaver = servicesAssembly.gameDataSaver

        let interactor = PlayInteractor(wordsProvider: wordsProvider,
                                        imageProvider: imageProvider,
                                        translater: translater,
                                        imageClassificator: imageClassificator,
                                        gameDataSaver: gameDataSaver)
        let presenter = PlayPresenter(interactor: interactor)
        let view = PlayView(presenter: presenter)

        interactor.output = presenter
        presenter.output = view

        if let router = router {
            if let router = router as? PlayRouterInput {
                presenter.router = router
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: router не поддерживает маршрутизацию PlayRouterInput")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
        }
        return view
    }

    func recordsModule() -> RecordsView {
        let gameDataProvider = servicesAssembly.gameDataProvider

        let interactor = RecordsInteractor(gameDataProvider: gameDataProvider)
        let presenter = RecordsPresenter(interactor: interactor)
        let view = RecordsView(presenter: presenter)

        interactor.output = presenter
        presenter.output = view

        if let router = router {
            if let router = router as? RecordsRouterInput {
                presenter.router = router
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: router не поддерживает маршрутизацию RecordsRouterInput")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
        }
        return view
    }

    func settingsModule() -> SettingsView {
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(interactor: interactor)
        let view = SettingsView(presenter: presenter)

        interactor.output = presenter
        presenter.output = view

        if let router = router {
            if let router = router as? SettingsRouterInput {
                presenter.router = router
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: router не поддерживает маршрутизацию SettingsRouterInput")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
        }
        return view
    }

    func aboutModule() -> AboutView {
        let interactor = AboutInteractor()
        let presenter = AboutPresenter(interactor: interactor)
        let view = AboutView(presenter: presenter)

        interactor.output = presenter
        presenter.output = view

        if let router = router {
            if let router = router as? AboutRouterInput {
                presenter.router = router
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: router не поддерживает маршрутизацию AboutRouterInput")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
        }
        return view
    }

    func reservedModule() -> ReservedView {
        let interactor = ReservedInteractor()
        let presenter = ReservedPresenter(interactor: interactor)
        let view = ReservedView(presenter: presenter)

        interactor.output = presenter
        presenter.output = view

        if let router = router {
            if let router = router as? ReservedRouterInput {
                presenter.router = router
            } else {
                #if DEBUG
                debugPrint("[PresentationAssembly]: router не поддерживает маршрутизацию ReservedRouterInput")
                #endif
            }
        } else {
            #if DEBUG
            debugPrint("[PresentationAssembly]: router не задан")
            #endif
        }
        return view
    }

}
