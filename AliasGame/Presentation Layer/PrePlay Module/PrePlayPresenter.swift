//
//  PrePlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 02/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol PrePlayPresenterInput {
    
    var router: PrePlayRouterInput? { get set }
    
    var output: PrePlayPresenterOutput? { get set }
    
    func exitTapped()
    
    func viewDidLoad()
    
    func startGameButtonTapped()
    
    func didReachLastPage()
    
}

protocol PrePlayPresenterOutput: class {
    
    func setSingleScreens(models: [SingleScreenModel], mode: AliasGameMode)
    
    func setGameInformationText(text: String)
    
    var configuredTimeForSet: Int { get }
    
    var configuredNumberOfRounds: Int { get }
    
}

protocol PrePlayRouterInput: class {
    
    func exitFromPrePlayModule()
    
    func startGameFromPrePlayModule(configuration: AliasGameConfiguration, nextTeam: Int)
    
}

class PrePlayPresenter: PrePlayPresenterInput {
    
    weak var router: PrePlayRouterInput?
    
    weak var output: PrePlayPresenterOutput?
    
    private var interactor: PrePlayInteractorInput
    
    
    init(interactor: PrePlayInteractorInput) {
        self.interactor = interactor
    }
    
    private var timeForSetString: String {
        let timeForSet = interactor.configuration.timeForSet
        switch timeForSet {
        case 15: return "15 секунд"
        case 30: return "30 секунд"
        case 60: return "1 минута"
        case 120: return "2 минуты"
        case 180: return "3 минуты"
        default: return "\(timeForSet) с"
        }
    }
    
    private let firstText = "Чтобы начать игру, нажмите далее"
    private let secondText = "Ваша задача объяснять слова. Например, слово телефон можно объяснить как средство связи, с помощью которого можно звонить."
    private let thirdText = "Выберите количество раундов"
    private let fourthText = "Выберите количество времени на сет"
    private var fivethText: String {
        let configuration = interactor.configuration
        return "Режим игры: \(configuration.mode.name)\n" +
            "Количество раундов: \(configuration.numberOfRounds)\n" +
        "Времени на сет: \(timeForSetString)"
    }
    
    lazy var models = [SingleScreenModel(title: "Начало игры", text: firstText, color: interactor.configuration.mode.color, buttonTitle: "Далее"),
                       SingleScreenModel(title: "Правила игры", text: secondText, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), buttonTitle: "Шаг 1 из 3"),
                       SingleScreenModel(title: "Раундов", text: thirdText, color: #colorLiteral(red: 0, green: 0.462745098, blue: 0.7294117647, alpha: 1), buttonTitle: "Шаг 2 из 3"),
                       SingleScreenModel(title: "Время", text: fourthText, color: #colorLiteral(red: 0.7960784314, green: 0.1607843137, blue: 0.4823529412, alpha: 1), buttonTitle: "Шаг 3 из 3"),
                       SingleScreenModel(title: "Игра настроена", text: fivethText, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), buttonTitle: "Начать играть")
    ]
    
    func viewDidLoad() {
        guard let output = output else {
            debugPrint("[PrePlayPresenter]: output is nil")
            return
        }
        output.setSingleScreens(models: models, mode: interactor.configuration.mode)
    }
    
    func exitTapped() {
        if let router = router {
            router.exitFromPrePlayModule()
        } else {
            #if DEBUG
            debugPrint("[PrePlayPresenter]: router is nil")
            #endif
        }
    }
    
    func startGameButtonTapped() {
        if let router = router {
            router.startGameFromPrePlayModule(configuration: interactor.configuration, nextTeam: 0)
        } else {
            #if DEBUG
            debugPrint("[PrePlayPresenter]: router is nil")
            #endif
        }
    }
    
    func didReachLastPage() {
        guard let output = output else {
            debugPrint("[PrePlayPresenter]: output is nil")
            return
        }
        interactor.set(numberOfRounds: output.configuredNumberOfRounds)
        interactor.set(timeForSet: output.configuredTimeForSet)
        output.setGameInformationText(text: fivethText)
    }
    
}

extension PrePlayPresenter: PrePlayInteractorOutput {
    
}
