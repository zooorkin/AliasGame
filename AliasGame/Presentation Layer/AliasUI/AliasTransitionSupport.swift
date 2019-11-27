//
//  AliasTransitionSupport.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 27/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasTransitionSupport {
    
    var backgroundWindow = UIWindow(frame: UIScreen.main.bounds)
    
    var mainWindow: UIWindow!
    
    var coveredWindow = UIWindow(frame: UIScreen.main.bounds)
    
    func performAliasTransition(viewController: UIViewController) {
        mainWindow = UIApplication.shared.keyWindow!
        backgroundWindow.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        backgroundWindow.makeKeyAndVisible()
        mainWindow.makeKeyAndVisible()
        viewController.view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 0.8)
        let playNavigationController = AliasNavigationController(rootViewController: viewController)
        let presentingViewController = LightStatusBarViewController()
        self.coveredWindow.rootViewController = presentingViewController
        self.coveredWindow.makeKeyAndVisible()
        presentingViewController.present(playNavigationController,
                                         animated: true, completion: nil)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.mainWindow.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: 0, y: -UIScreen.main.bounds.height * 0.13)
        }, completion: nil)
    }
    
    func performAliasUntransition() {
        coveredWindow.rootViewController!.dismiss(animated: true, completion: {
            self.coveredWindow.rootViewController = nil
            self.coveredWindow.isHidden = true
        })
        mainWindow.makeKey()
        UIView.animate(withDuration: 0.3, animations: {
            self.mainWindow.transform = .identity
        }, completion: nil)
    }
    
}
