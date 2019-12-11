//
//  MockPrePlayRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockPrePlayRouter: PrePlayRouterInput {
    
    /// Число вызовов функции exitFromPrePlayModule
    private var exitFromPrePlayModuleCallsCount = 0
    /// Число вызовов функции startGameFromPrePlayModule
    private var startGameFromPrePlayModuleCallsCount = 0
    
    
    func exitFromPrePlayModule() {
        exitFromPrePlayModuleCallsCount += 1
    }
    
    func startGameFromPrePlayModule(configuration: AliasGameConfiguration, nextTeam: Int) {
        startGameFromPrePlayModuleCallsCount += 1
    }

    
    /// Проверка числа вызовов функции exitFromPrePlayModule
    func verifyExitFromPrePlayModuleCallsCount(block: (Int) -> Void) {
        block(exitFromPrePlayModuleCallsCount)
    }
    
    /// Проверка числа вызовов функции startGameFromPrePlayModule
    func verifyStartGameFromPrePlayModuleCallsCount(block: (Int) -> Void) {
        block(startGameFromPrePlayModuleCallsCount)
    }
    


}
