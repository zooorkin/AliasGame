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

class Router: RouterInput {

    var viewController: UIViewController {
        return navigationController
    }

    private let presentationAssembly: PresentationAssemblyProtocol

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }()

    init(presentationAssembly: PresentationAssemblyProtocol) {
        self.presentationAssembly = presentationAssembly
    }

    public func start() {
        let viewController = presentationAssembly.startModule()
        navigationController.pushViewController(viewController, animated: false)
    }

}

extension Router: StartRouterInput {
    
    func play() {
        let playViewController = presentationAssembly.playModule()
        navigationController.pushViewController(playViewController, animated: true)
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
        navigationController.pushViewController(aboutViewController, animated: true)
    }
    
}

extension Router: PlayRouterInput {
    
    func exitFromPlayModule() {
        navigationController.popViewController(animated: true)
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
        navigationController.popViewController(animated: true)
    }

}

extension Router: ReservedRouterInput {
    func exitFromReservedModule() {
        navigationController.popViewController(animated: true)
    }
    

}

