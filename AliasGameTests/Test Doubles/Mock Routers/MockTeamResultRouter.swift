//
//  MockTeamRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockTeamResultRouter: TeamResultRouterInput {

    /// Число вызовов функции exitFromTeamResultModule
    private var exitFromTeamResultModuleCallsCount = 0
    
    
    func exitFromTeamResultModule() {
        exitFromTeamResultModuleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции exitFromTeamResultModule
    func verifyExitFromTeamResultModuleCallsCount(block: (Int) -> Void) {
        block(exitFromTeamResultModuleCallsCount)
    }
    
}
