//
//  ICoordinator.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol ICoordinator {

    var viewController: UIViewController { get }

    func start()

}
