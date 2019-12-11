//
//  MockSettingsRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockSettingsRouter: SettingsRouterInput {

    /// Число вызовов функции exitFromSettingsModule
    private var exitFromSettingsModuleCallsCount = 0
    
    
    func exitFromSettingsModule() {
        exitFromSettingsModuleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции exitFromSettingsModule
    func verifyExitFromSettingsModuleCallsCount(block: (Int) -> Void) {
        block(exitFromSettingsModuleCallsCount)
    }
    
}
