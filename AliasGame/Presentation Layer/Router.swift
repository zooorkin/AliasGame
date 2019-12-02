//
//  Router.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol RouterInput {
    
    var viewController: UIViewController { get }
    
    func start()
    
}

class Router: AliasTransitionSupport, RouterInput {
    
    var viewController: UIViewController {
        return navigationController
    }

    private let presentationAssembly: PresentationAssemblyProtocol

    private lazy var navigationController: UINavigationController = {
        let navigationController = AliasDarkNavigationController()
        return navigationController
    }()

    init(presentationAssembly: PresentationAssemblyProtocol) {
        self.presentationAssembly = presentationAssembly
        super.init()
    }

    public func start() {
        let viewController = presentationAssembly.startModule()
        navigationController.pushViewController(viewController, animated: false)
    }

}

extension Router: StartRouterInput {
    
    func play(mode: AliasGameMode) {
        let prePlayViewController = presentationAssembly.prePlayModule()
        performAliasTransition(viewController: prePlayViewController, animated: true)
    }
    
    func records() {
        let recordsViewController = presentationAssembly.recordsModule()
        navigationController.pushViewController(recordsViewController, animated: true)
    }
    
    func settings() {
        let settingsViewController = presentationAssembly.settingsModule()
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
    func aboutGame() {
        let aboutViewController = presentationAssembly.aboutModule()
        performAliasTransition(viewController: aboutViewController, animated: true)
    }
    
}

extension Router: PrePlayRouterInput {
    
    func exitFromPrePlayModule() {
        performAliasUntransition()
    }
    
    func startGameFromPrePlayModule() {
        let playView = presentationAssembly.playModule(mode: .twoTeams)
        coveredNavigationController.pushViewController(playView, animated: true)
    }
    
}

extension Router: PlayRouterInput {
    
    func exitFromPlayModule() {
        performAliasUntransition()
    }
    
}

extension Router: RecordsRouterInput {
    
    func exitFromRecordsModule() {
        navigationController.popViewController(animated: true)
    }

}

extension Router: SettingsRouterInput {
    
    func exitFromSettingsModule() {
        navigationController.popViewController(animated: true)
    }

}

extension Router: AboutRouterInput {
    
    func exitFromAboutModule() {
        performAliasUntransition()
    }

}

extension Router: ReservedRouterInput {
    func exitFromReservedModule() {
        navigationController.popViewController(animated: true)
    }
    

}

