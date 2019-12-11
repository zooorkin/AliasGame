//
//  MockReadyRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockReadyRouter: ReadyRouterInput {
    
    /// Число вызовов функции exitFromReadyModule
    private var exitFromReadyModuleCallsCount = 0
    /// Число вызовов функции letsPlayFromReadyModule
    private var letsPlayFromReadyModuleCallsCount = 0
    
    
    func exitFromReadyModule() {
        exitFromReadyModuleCallsCount += 1
    }
    func letsPlayFromReadyModule() {
        letsPlayFromReadyModuleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции exitFromReadyModule
    func verifyExitFromReadyModuleCallsCount(block: (Int) -> Void) {
        block(exitFromReadyModuleCallsCount)
    }
    
    /// Проверка числа вызовов функции letsPlayFromReadyModule
    func verifyLetsPlayFromReadyModuleCallsCount(block: (Int) -> Void) {
        block(letsPlayFromReadyModuleCallsCount)
    }

}
