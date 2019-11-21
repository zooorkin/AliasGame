//
//  Coordinator.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class Coordinator: ICoordinator {


    public var viewController: UIViewController {
        return navigationController
    }

    private let presentationAssembly: IPresentationAssembly

    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }()

    init(presentationAssembly: IPresentationAssembly) {
        self.presentationAssembly = presentationAssembly
    }

    public func start() {
        let viewController = presentationAssembly.startViewController()
        navigationController.pushViewController(viewController, animated: false)
    }

}

extension Coordinator: IStartCoordinator {
    
    func play() {
        let playViewController = presentationAssembly.playViewController()
        navigationController.pushViewController(playViewController, animated: true)
    }
    
    func records() {
        let recordsViewController = presentationAssembly.recordsViewController()
        navigationController.pushViewController(recordsViewController, animated: true)
    }
    
    func settings() {
        let settingsViewController = presentationAssembly.settingsViewController()
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
    func aboutGame() {
        let aboutViewController = presentationAssembly.aboutViewController()
        navigationController.pushViewController(aboutViewController, animated: true)
    }
    
}

extension Coordinator: IPlayCoordinator {
    
    func exitFromPlayModule() {
        navigationController.popViewController(animated: true)
    }

}

extension Coordinator: IRecordsCoordinator {
    
    func exitFromRecordsModule() {
        navigationController.popViewController(animated: true)
    }

}

extension Coordinator: ISettingsCoordinator {
    
    func exitFromSettingsModule() {
        navigationController.popViewController(animated: true)
    }

}

extension Coordinator: IAboutCoordinator {
    
    func exitFromAboutModule() {
        navigationController.popViewController(animated: true)
    }

}

extension Coordinator: IReservedCoordinator {

}

