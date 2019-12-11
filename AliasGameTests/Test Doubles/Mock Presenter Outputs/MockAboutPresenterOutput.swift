//
//  MockAboutPresenterOutput.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation

class MockAboutPresenterOutput: AboutPresenterOutput {
    
    /// Число вызовов функции setText
    private var setTextCallsCount = 0
    /// Число вызовов функции setTitle
    private var setTitleCallsCount = 0
    
    
    func setText(text: String) {
        setTextCallsCount += 1
    }
    func setTitle(title: String) {
        setTitleCallsCount += 1
    }
    
    
    /// Проверка числа вызовов функции setText
    func verifySetTextCallsCount(block: (Int) -> Void) {
        block(setTextCallsCount)
    }
    
    /// Проверка числа вызовов функции setTitle
    func verifySetTitleCallsCount(block: (Int) -> Void) {
        block(setTitleCallsCount)
    }
    
}
