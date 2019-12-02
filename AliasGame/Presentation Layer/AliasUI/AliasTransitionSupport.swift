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
    
    private var savedFrame: CGRect = .zero
    
    func performAliasTransition(viewController: UIViewController, fullscreen: Bool) {
        mainWindow = UIApplication.shared.keyWindow!
        backgroundWindow.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        backgroundWindow.makeKeyAndVisible()
        mainWindow.makeKeyAndVisible()
        let playNavigationController: UINavigationController
        if fullscreen {
            playNavigationController = AliasLightNavigationController(rootViewController: viewController)
        } else {
            viewController.view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 0.8)
            playNavigationController = AliasDarkNavigationController(rootViewController: viewController)
        }
        let presentingViewController = LightStatusBarViewController()
        self.coveredWindow.rootViewController = presentingViewController
        self.coveredWindow.makeKeyAndVisible()
        presentingViewController.present(playNavigationController,
                                         animated: true, completion: nil)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.mainWindow.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: 0, y: -UIScreen.main.bounds.height * 0.13)
        }, completion: { finished in
            self.savedFrame = self.mainWindow.frame
        })
    }
    
    func performAliasUntransition() {
        // Eсли менялся размер экрана при Split View
        let secondSavedFrame = coveredWindow.frame
        coveredWindow.rootViewController!.dismiss(animated: true, completion: {
            self.coveredWindow.rootViewController = nil
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

//let xInsets = mainWindow.frame.width * 0.2
//let yInsets = mainWindow.frame.height * 0.2
//let frame = mainWindow.frame
//    .insetBy(dx: xInsets, dy: yInsets)
//    .offsetBy(dx: 0, dy: -UIScreen.main.bounds.height * 0.13)
//UIView.animate(withDuration: 0.3, animations: {
//    self.mainWindow.frame = frame
//}, completion: nil)
