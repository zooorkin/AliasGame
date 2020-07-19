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

class Router: AliasTransitionSupport, RouterInput {
    
    
    weak var delegate: RouterDelegate?
    
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
        navigationController.pushViewController(aboutViewController, animated: true)
    }
    
}

extension Router: PrePlayRouterInput {
    
    func exitFromPrePlayModule() {
        preparingPlayModule = nil
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
    
    func showRoundResult(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void) {
        let resultView = presentationAssembly.teamResultModule(configuration: configuration, teamResult: teamResult, completion: completion)
        secondCoveredNavigationController.pushViewController(resultView, animated: true)
    }
    
    func showResult(title: String, emoji: String, text: String, buttonTitle: String, completion: @escaping () -> Void) {
        let resultView = presentationAssembly.resultModule(title: title, emoji: emoji, text: text, buttonTitle: buttonTitle, completion: completion)
        secondCoveredNavigationController.pushViewController(resultView, animated: true)
    }
    
    func showTeamResult(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void) {
        let resultView = presentationAssembly.teamResultModule(configuration: configuration, teamResult: teamResult, completion: completion)
        secondCoveredNavigationController = AliasLightNavigationController(rootViewController: resultView)
		secondCoveredNavigationController.modalPresentationStyle = .fullScreen
        coveredNavigationController.present(secondCoveredNavigationController, animated: true, completion: nil)
    }
    
    func exitFromPlayModule() {
        preparingPlayModule = nil
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
            debugPrint("[Router]: Слова не удалось загрузить, закрытие модулей PrePlay, Ready")
            performAliasUntransition()
        } else {
            coveredNavigationController.dismiss(animated: true, completion: {
                self.performAliasUntransition()
            })
        }
        
    }
    
    func readyFromPlayModule(configuration: AliasGameConfiguration, nextTeam: Int) {
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

extension Router: ReadyRouterInput {
    
    func exitFromReadyModule() {
        preparingPlayModule = nil
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

extension Router: TeamResultRouterInput {
    
    func exitFromTeamResultModule() {
        preparingPlayModule = nil
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
        navigationController.popViewController(animated: true)
    }

}
