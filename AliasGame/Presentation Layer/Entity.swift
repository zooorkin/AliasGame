//
//  Entity.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 26/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

struct TeamResult {
    
}

struct RoundResult {
    
}

struct GameResult {
    
}

struct AliasGameConfiguration {
    
    let mode: AliasGameMode
    
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
    
    let numberOfRounds: Int
    
    let time: Int
    
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
