//
//  MockPlayInteractorOutput.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class MockPlayInteractorOutput: PlayInteractorOutput {
    
    /// Число вызовов функции interactorFailedAction
    private var interactorFailedActionCallsCount = 0
    /// Число вызовов функции interactorDidLoadWords
    private var interactorDidLoadWordsCallsCount = 0
    /// Число вызовов функции interactorDidNotLoadWords
    private var interactorDidNotLoadWordsCallsCount = 0
    /// Число вызовов функции timeIsOver
    private var timeIsOverCallsCount = 0
    /// Число вызовов функции tac
    private var tacCallsCount = 0
    
    
    func interactorFailedAction(with message: String) {
        interactorFailedActionCallsCount += 1
    }
    func interactorDidLoadWords() {
        interactorDidLoadWordsCallsCount += 1
    }
    func interactorDidNotLoadWords() {
        interactorDidNotLoadWordsCallsCount += 1
    }
    func timeIsOver() {
        timeIsOverCallsCount += 1
    }
    func tac() {
        tacCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции interactorFailedAction
    func verifyInteractorFailedActionCallsCount(block: (Int) -> Void) {
        block(interactorFailedActionCallsCount)
    }
    
    /// Проверка числа вызовов функции interactorDidLoadWords
    func verifyInteractorDidLoadWordsCallsCount(block: (Int) -> Void) {
        block(interactorDidLoadWordsCallsCount)
    }
    
    /// Проверка числа вызовов функции interactorDidNotLoadWords
    func verifyInteractorDidNotLoadWordsCallsCount(block: (Int) -> Void) {
        block(interactorDidNotLoadWordsCallsCount)
    }
    
    /// Проверка числа вызовов функции timeIsOver
    func verifyTimeIsOverCallsCount(block: (Int) -> Void) {
        block(timeIsOverCallsCount)
    }
    
    /// Проверка числа вызовов функции tac
    func verifyTacCallsCount(block: (Int) -> Void) {
        block(tacCallsCount)
    }
    
}
