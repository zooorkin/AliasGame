//
//  MockResultRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockResultRouter: ResultRouterInput {

    /// Число вызовов функции exitFromResultModule
    private var exitFromResultModuleCallsCount = 0
    
    
    func exitFromResultModule() {
        exitFromResultModuleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции exitFromResultModule
    func verifyExitFromResultModuleCallsCount(block: (Int) -> Void) {
        block(exitFromResultModuleCallsCount)
    }
    
}
