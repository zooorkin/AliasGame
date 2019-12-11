//
//  Entity.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 26/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

struct TeamResult {
    let configuration: AliasGameConfiguration
    let score: Int
    let team: Int
}

struct RoundResult {
    let configuration: AliasGameConfiguration
    let scores: [Int]
    let round: Int
}

struct GameResult {
    let configuration: AliasGameConfiguration
    let scores: [Int]
    let round: Int
}

/// Настройки игры
struct AliasGameConfiguration {
    /// Режим игры
    let mode: AliasGameMode
    /// Количество команд
    var numberOfTeams: Int {
        switch mode {
        case .twoPlayers: return 2
        case .threePlayers: return 3
        case .fourPlayers: return 4
        case .fivePlayers: return 5
        case .sixPlayers: return 6
        case .sevenPlayers: return 7
        case .eightPlayers: return 8
        case .ninePlayers: return 9
            
        case .twoTeams: return 2
        case .threeTeams: return 3
        case .fourTeams: return 4
        }
    }
    /// Тип команды
    var teamMode: Bool {
        switch mode {
        case .twoPlayers: fallthrough
        case .threePlayers: fallthrough
        case .fourPlayers: fallthrough
        case .fivePlayers: fallthrough
        case .sixPlayers: fallthrough
        case .sevenPlayers: fallthrough
        case .eightPlayers: fallthrough
        case .ninePlayers: return false
            
        case .twoTeams: fallthrough
        case .threeTeams: fallthrough
        case .fourTeams: return true
        }
    }
    /// Количество раундов
    let numberOfRounds: Int
    /// Времени на сет
    let timeForSet: Int
    
    static var `default`: AliasGameConfiguration {
        return .init(mode: .twoPlayers, numberOfRounds: 3, timeForSet: 60)
    }
    
}

/// Alias-слово
struct AliasWord {
    /// Слово
    let word: String
    /// Перевод
    let translate: String?
    /// Картинка
    var image: UIImage?
}

/// Режимы игры
enum AliasGameMode {
    case twoPlayers
    case threePlayers
    case fourPlayers
    case fivePlayers
    case sixPlayers
    case sevenPlayers
    case eightPlayers
    case ninePlayers
    /// Командные режимы
    case twoTeams
    case threeTeams
    case fourTeams
    
    var name: String {
        switch self {
        case .twoPlayers: return "Два игрока"
        case .threePlayers: return "Три игрока"
        case .fourPlayers: return "Четыре игрока"
        case .fivePlayers: return "Пять игроков"
        case .sixPlayers: return "Шесть игроков"
        case .sevenPlayers: return "Семь игроков"
        case .eightPlayers: return "Восемь игроков"
        case .ninePlayers: return "Девять игроков"
            
        case .twoTeams: return "Две команды"
        case .threeTeams: return "Три команды"
        case .fourTeams: return "Четыре команды"
        }
    }
    
    var teamType: String {
        switch self {
        case .twoPlayers: fallthrough
        case .threePlayers: fallthrough
        case .fourPlayers: fallthrough
        case .fivePlayers: fallthrough
        case .sixPlayers: fallthrough
        case .sevenPlayers: fallthrough
        case .eightPlayers: fallthrough
        case .ninePlayers: return "Игрок"
            
        case .twoTeams: fallthrough
        case .threeTeams: fallthrough
        case .fourTeams: return "Команда"
        }
    }
    
    var image: UIImage {
        switch self {
        case .twoPlayers: return #imageLiteral(resourceName: "game-mode-2")
        case .threePlayers: return #imageLiteral(resourceName: "game-mode-3")
        case .fourPlayers: return #imageLiteral(resourceName: "game-mode-4")
        case .fivePlayers: return #imageLiteral(resourceName: "game-mode-5")
        case .sixPlayers: return #imageLiteral(resourceName: "game-mode-6")
        case .sevenPlayers: return #imageLiteral(resourceName: "game-mode-7")
        case .eightPlayers: return #imageLiteral(resourceName: "game-mode-8")
        case .ninePlayers: return #imageLiteral(resourceName: "game-mode-9")
        case .twoTeams: return #imageLiteral(resourceName: "game-mode-teams-2")
        case .threeTeams: return #imageLiteral(resourceName: "game-mode-teams-3")
        case .fourTeams: return #imageLiteral(resourceName: "game-mode-teams-4")
        }
    }
    
    var color: UIColor {
        switch self {
        case .twoPlayers: return #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3058823529, alpha: 1)
        case .threePlayers: return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .fourPlayers: return #colorLiteral(red: 0, green: 0.6588235294, blue: 0.6156862745, alpha: 1)
        case .fivePlayers: return #colorLiteral(red: 0, green: 0.462745098, blue: 0.7294117647, alpha: 1)
        case .sixPlayers: return #colorLiteral(red: 0.7960784314, green: 0.1607843137, blue: 0.4823529412, alpha: 1)
        case .sevenPlayers: return #colorLiteral(red: 0.9725490196, green: 0.7294117647, blue: 0, alpha: 1)
        case .eightPlayers: return #colorLiteral(red: 0.9725490196, green: 0.5058823529, blue: 0.1333333333, alpha: 1)
        case .ninePlayers: return #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        case .twoTeams: return #colorLiteral(red: 1, green: 0.3921568627, blue: 0.3058823529, alpha: 1)
        case .threeTeams: return #colorLiteral(red: 0, green: 0.462745098, blue: 0.7294117647, alpha: 1)
        case .fourTeams: return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }
    
}

/// Результат игры
struct AliasGameResult {
    /// Идентификатор игры
    let gameID: String
    /// Игровой режим
    let mode: String
    /// Дата игры
    let date: Date
    /// Продолжительность игры
    let duration: TimeInterval
    /// Финальный счёт
    let totalScore: [Int]
}

/// Данные игры
struct AliasGameData {
    /// Идентификатор игры
    let gameID: String
    /// Номер раунда
    let round: Int
    /// Номер команды
    let team: Int
    ///
    let result: TeamRoundResult
}

/// Результат команды в раунде
struct TeamRoundResult {
    /// Счёт команды в раунде
    let score: Int
    /// Угаданные слова команды в раунде
    let guessedWords: [String]
    /// Неугаданные слова команды в раунде
    let notGuessedWords: [String]
}
