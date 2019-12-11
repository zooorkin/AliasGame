//
//  MockStartRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockStartRouter: StartRouterInput {
    
    /// Число вызовов функции play
    private var playCallsCount = 0
    /// Число вызовов функции records
    private var recordsCallsCount = 0
    /// Число вызовов функции settings
    private var settingsCallsCount = 0
    /// Число вызовов функции aboutGame
    private var aboutGameCallsCount = 0
    
    
    func play(mode: AliasGameMode) {
        playCallsCount += 1
    }
    func records() {
        recordsCallsCount += 1
    }
    func settings() {
        settingsCallsCount += 1
    }
    func aboutGame() {
        aboutGameCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции play
    func verifyPlayCallsCount(block: (Int) -> Void) {
        block(playCallsCount)
    }
    
    /// Проверка числа вызовов функции records
    func verifyRecordsCallsCount(block: (Int) -> Void) {
        block(recordsCallsCount)
    }
    
    /// Проверка числа вызовов функции settings
    func verifySettingsCallsCount(block: (Int) -> Void) {
        block(settingsCallsCount)
    }
    
    /// Проверка числа вызовов функции aboutGame
    func verifyAboutGameCallsCount(block: (Int) -> Void) {
        block(aboutGameCallsCount)
    }
    
}
