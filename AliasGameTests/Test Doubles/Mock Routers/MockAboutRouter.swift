//
//  MockAboutRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockAboutRouter: AboutRouterInput {
    
    /// Число вызовов функции exitFromAboutModule
    private var exitFromAboutModuleCallsCount = 0
    
    
    func exitFromAboutModule() {
        exitFromAboutModuleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции exitFromAboutModule
    func verifyExitFromAboutModuleCallsCount(block: (Int) -> Void) {
        block(exitFromAboutModuleCallsCount)
    }

}
