//
//  MockPlayRouter.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class MockPlayRouter: PlayRouterInput {
    
    /// Число вызовов функции exitFromPlayModule
    private var exitFromPlayModuleCallsCount = 0
    
    
    func showRoundResult(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void) {
        
    }
    
    func showResult(title: String, emoji: String, text: String, buttonTitle: String, completion: @escaping () -> Void) {
        
    }
    
    func showTeamResult(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void) {
        
    }
    
    func exitFromPlayModule() {
        exitFromPlayModuleCallsCount += 1
    }
    
    func playModuleDidLoadWords() {
        
    }
    
    func playModuleDidNotLoadWords() {
    
    }
    
    func readyFromPlayModule(configuration: AliasGameConfiguration, nextTeam: Int) {
        
    }
    
    /// Проверка числа вызовов функции exitFromPlayModule
    func verifyExitFromPlayModuleCallsCount(block: (Int) -> Void) {
        block(exitFromPlayModuleCallsCount)
    }

}
