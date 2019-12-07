//
//  AliasTransitionSupport.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 27/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasTransitionSupport {
    
    lazy var backgroundWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        mainWindow = UIApplication.shared.keyWindow!
        window.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        window.makeKeyAndVisible()
        mainWindow.makeKeyAndVisible()
        return window
    }()
    
    var mainWindow: UIWindow!
    
    lazy var coveredWindow: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = coveredRootViewController
        return window
    }()

    var coveredNavigationController: UINavigationController!
    
    private lazy var coveredRootViewController: UINavigationController = {
        let navigationController = AliasDarkNavigationController()
        return navigationController
    }()
    
    private var savedFrame: CGRect = .zero
    
    func performAliasTransition(viewController: UIViewController, animated: Bool) {
        let _ = backgroundWindow
        self.coveredWindow.makeKeyAndVisible()
        
        coveredNavigationController = AliasLightNavigationController(rootViewController: viewController)
        coveredRootViewController.present(coveredNavigationController, animated: animated, completion: nil)
        UIView.animate(withDuration: 0.3, animations: {
            self.mainWindow.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: 0, y: -UIScreen.main.bounds.height * 0.13)
        }, completion: { finished in
            self.savedFrame = self.mainWindow.frame
        })
    }
    
    func performAliasUntransition() {
        // Eсли менялся размер экрана при Split View
        let secondSavedFrame = coveredWindow.frame
        coveredRootViewController.dismiss(animated: true, completion: {
            self.coveredNavigationController = nil
            self.coveredWindow.isHidden = true
        })
        mainWindow.makeKey()
        // Если сбросился frame после выхода на Home Screen
        self.mainWindow.frame = self.savedFrame
        UIView.animate(withDuration: 0.3, animations: {
            self.mainWindow.transform = .identity
            self.mainWindow.frame = secondSavedFrame
        }, completion: { finished in
            UIView.animate(withDuration: 0.3) {
                
            }
        })
    }
    
}
