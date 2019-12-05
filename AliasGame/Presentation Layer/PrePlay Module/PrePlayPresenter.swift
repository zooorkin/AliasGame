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
    
}

protocol PrePlayPresenterOutput: class {
    
    func setSingleScreens(models: [SingleScreenModel])
    
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
    
    private let firstText = "Чтобы начать игру, нажмите Далее"
    private let secondText = "Здесь будут написаны правила игры"
    private let thirdText = "Выберите количество раундов"
    private let fourthText = "Выберите количество времени"
    private var fivethText: String {
        let configuration = interactor.configuration
        return "Режим игры: \(configuration.mode.name)\n" +
            "Количество раундов: \(configuration.numberOfRounds)\n" +
        "Времени на сет: \(configuration.timeForSet) секунд"
    }
    
    lazy var models = [SingleScreenModel(title: "Начало игры", text: firstText, color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), buttonTitle: "Далее"),
                       SingleScreenModel(title: "Правила игры", text: secondText, color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), buttonTitle: "Далее"),
                       SingleScreenModel(title: "Раундов", text: thirdText, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), buttonTitle: "Далее"),
                       SingleScreenModel(title: "Время", text: fourthText, color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), buttonTitle: "Далее"),
                       SingleScreenModel(title: "Игра настроена", text: fivethText, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), buttonTitle: "К игре")
    ]
    
    func viewDidLoad() {
        guard let output = output else {
            debugPrint("[PrePlayPresenter]: output is nil")
            return
        }
        output.setSingleScreens(models: models)
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
    
}

extension PrePlayPresenter: PrePlayInteractorOutput {
    
}
