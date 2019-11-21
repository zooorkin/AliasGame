//
//  IPresentationAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol IPresentationAssembly {

    var coordinator: ICoordinator? { get set }

    var coordinatorViewController: UIViewController? { get }


    init(servicesAssembly: IServicesAssembly)


    func navigationController(rootViewController: UIViewController) -> UINavigationController

    func startViewController() -> StartViewController

    func playViewController() -> PlayViewController

    func recordsViewController() -> RecordsViewController

    func settingsViewController() -> SettingsViewController

    func aboutViewController() -> AboutViewController

    func reservedViewController() -> ReservedViewController

}
