//
//  Router.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol RouterInput {
    
    var delegate: RouterDelegate? { get set }
    
    var viewController: UIViewController { get }
    
    func start()
    
}

protocol RouterDelegate {
    
    func wordsDidLoad()
    
}

class Router: AliasTransitionSupport, RouterInput {
    
    
    var delegate: RouterDelegate?
    
    var wordsDidLoad = false
    
    var preparingPlayModule: PlayView?
    
    var viewController: UIViewController {
        return navigationController
    }
    
    private var secondCoveredNavigationController: UINavigationController!

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
        let prePlayViewController = presentationAssembly.prePlayModule(mode: mode)
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
    
    func startGameFromPrePlayModule(configuration: AliasGameConfiguration, nextTeam: Int) {
        preparingPlayModule = presentationAssembly.playModule(configuration: configuration)
        let readyView = presentationAssembly.readyModule()
        readyView.setConfiguration(configuration, nextTeam: nextTeam)
        coveredNavigationController.pushViewController(readyView, animated: true)
    }
    
}

extension Router: PlayRouterInput {
    
    func showResult(configuration: AliasGameConfiguration, nextTeam: Int, teamResult: TeamResult, roundResult: RoundResult?, gameResult: GameResult?) {
        let resultView = presentationAssembly.resultModule(configuration: configuration, teamResult: teamResult, nextTeam: nextTeam)
        secondCoveredNavigationController = AliasLightNavigationController(rootViewController: resultView)
        coveredNavigationController.present(secondCoveredNavigationController, animated: true, completion: nil)
    }
    
    func exitFromPlayModule() {
        performAliasUntransition()
    }
    
    func playModuleDidLoadWords() {
        wordsDidLoad = true
        guard let delegate = delegate else {
            debugPrint("[Router]: delegate is nil")
            return
        }
        delegate.wordsDidLoad()
    }
    
    func playModuleDidNotLoadWords() {
        preparingPlayModule = nil
        
        if coveredNavigationController.topViewController is ReadyView {
            performAliasUntransition()
        } else {
            coveredNavigationController.dismiss(animated: true, completion: {
                self.performAliasUntransition()
            })
        }
        
    }
    
}

extension Router: ReadyRouterInput {
    
    func exitFromReadyModule() {
        performAliasUntransition()
    }
    
    func letsPlayFromReadyModule() {
        if coveredNavigationController.topViewController is ReadyView {
            guard let preparingPlayModule = preparingPlayModule else {
                assertionFailure("[Router]: Модуль Play, для которого должны были настроиться слова, is nil")
                return
            }
            coveredNavigationController.pushViewController(preparingPlayModule, animated: true)
        } else {
            coveredNavigationController.dismiss(animated: true, completion: nil)
        }
        wordsDidLoad = false
    }
    
    
}

extension Router: ResultRouterInput {
    
    func exitFromResultModule() {
        performAliasUntransition()
    }
    
    func nextFromResultModule(configuration: AliasGameConfiguration, nextTeam: Int) {
        let readyView = presentationAssembly.readyModule()
        readyView.setConfiguration(configuration, nextTeam: nextTeam)
        if wordsDidLoad {
            if let delegate = delegate {
                delegate.wordsDidLoad()
            } else {
                debugPrint("[Router]: delegate is nil")
            }
        }
        secondCoveredNavigationController.pushViewController(readyView, animated: true)
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

