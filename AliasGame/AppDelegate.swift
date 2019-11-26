//
//  AppDelegate.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let rootAssembly: RootAssemblyProtocol = RootAssembly()

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = window else {
            assertionFailure("[AppDelegate] window is not available")
            return true 
        }
        
        if let routerViewController = rootAssembly.presentationAssembly.routerViewController {
            window.rootViewController = routerViewController
        } else {
            assertionFailure("[AppDelegate] routerViewController is not available")
        }
        
        window.makeKeyAndVisible()
        
        return true
    }

}

