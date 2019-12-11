//
//  MockRecordsRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockRecordsRouter: RecordsRouterInput {

    /// Число вызовов функции exitFromRecordsModule
    private var exitFromRecordsModuleCallsCount = 0
    
    
    func exitFromRecordsModule() {
        exitFromRecordsModuleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции exitFromRecordsModule
    func verifyExitFromRecordsModuleCallsCount(block: (Int) -> Void) {
        block(exitFromRecordsModuleCallsCount)
    }
    
}
