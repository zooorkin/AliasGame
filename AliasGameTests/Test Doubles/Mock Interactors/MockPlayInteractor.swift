//
//  MockPlayInteractor.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockPlayInteractor: PlayInteractorInput {
    
    var output: PlayInteractorOutput?
    
    var configuration: AliasGameConfiguration {
        fatalError()
    }
    
    var words: [AliasWord] {
        let word = AliasWord(word: "", translate: nil, image: nil)
        return .init(repeating: word, count: 50)
    }
    
    var team: Int {
        fatalError()
    }
    
    var round: Int {
        fatalError()
    }
    
    var scores: [Int] {
        fatalError()
    }
    
    var timeLeft: Int {
        return 60
    }
    
    /// Число вызовов функции nextTeam
    private var nextTeamCallsCount = 0
    /// Число вызовов функции nextRound
    private var nextRoundCallsCount = 0
    /// Число вызовов функции loadWords
    private var loadWordsCallsCount = 0
    /// Число вызовов функции startTimer
    private var startTimerCallsCount = 0
    /// Число вызовов функции stopTimer
    private var stopTimerCallsCount = 0
    /// Число вызовов функции setupTime
    private var setupTimeCallsCount = 0
    
    
    func nextTeam(withSaving score: Int) {
        nextTeamCallsCount += 1
    }
    func nextRound() {
        nextRoundCallsCount += 1
    }
    func loadWords() {
        loadWordsCallsCount += 1
    }
    func startTimer() {
        startTimerCallsCount += 1
    }
    func stopTimer() {
        stopTimerCallsCount += 1
    }
    func setupTime() {
        setupTimeCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции nextTeam
    func verifyNextTeamCallsCount(block: (Int) -> Void) {
        block(nextTeamCallsCount)
    }
    
    /// Проверка числа вызовов функции nextRound
    func verifyNextRoundCallsCount(block: (Int) -> Void) {
        block(nextRoundCallsCount)
    }
    
    /// Проверка числа вызовов функции loadWords
    func verifyLoadWordsCallsCount(block: (Int) -> Void) {
        block(loadWordsCallsCount)
    }
    
    /// Проверка числа вызовов функции startTimer
    func verifyStartTimerCallsCount(block: (Int) -> Void) {
        block(startTimerCallsCount)
    }
    
    /// Проверка числа вызовов функции stopTimer
    func verifyStopTimerCallsCount(block: (Int) -> Void) {
        block(stopTimerCallsCount)
    }
    
    /// Проверка числа вызовов функции setupTime
    func verifySetupTimeCallsCount(block: (Int) -> Void) {
        block(setupTimeCallsCount)
    }

}
