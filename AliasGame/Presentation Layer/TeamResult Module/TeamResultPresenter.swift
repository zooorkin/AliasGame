//
//  TeamResultPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 04/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

protocol TeamResultPresenterInput {
    
    func buttonTapped()
    
    func viewDidLoad()
    
}

protocol TeamResultPresenterOutput: class {
    
    func setTeamResult(score: Int, emoji: String, text: String)
    
}

protocol TeamResultRouterInput: class {
    
    func exitFromTeamResultModule()
    
}

class TeamResultPresenter: TeamResultPresenterInput {
    
    weak var router: TeamResultRouterInput?
    
    weak var output: TeamResultPresenterOutput?
    
    let configuration: AliasGameConfiguration
    
    let teamResult: TeamResult
    
    let completion: () -> Void
    
    init(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void) {
        self.configuration = configuration
        self.teamResult = teamResult
        self.completion = completion
    }
    
    
    func buttonTapped() {
        completion()
    }
    
    func viewDidLoad() {
        guard let output = output else {
            debugPrint("[TeamResultPresenter]: output is nil")
            return
        }
        let score = teamResult.score
        let emoji: String
        switch score {
        case 0: emoji = "😏"
        case -13: emoji = "👿"
        case 13: emoji = "😈"
        case score where score >= 10: emoji = "🤪"
        case score where score < 0: emoji = "😟"
        default: emoji = "😁"
        }
        let text = "«Пройденный путь и есть награда.»\n\nСтив Джобс, 1983 г."
        output.setTeamResult(score: teamResult.score, emoji: emoji, text: text)
    }
    
}
