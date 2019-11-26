//
//  Entity.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 26/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

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
