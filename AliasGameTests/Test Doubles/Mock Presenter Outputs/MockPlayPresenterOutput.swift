//
//  MockPlayOutput.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class MockPlayPresenterOutput: PlayPresenterOutput {
    
    /// Число вызовов функции setCurrentWord
    private var setCurrentWordCallsCount = 0
    /// Число вызовов функции setCurrentTeam
    private var setCurrentTeamCallsCount = 0
    /// Число вызовов функции setTimeLeft
    private var setTimeLeftCallsCount = 0
    /// Число вызовов функции setCurrentRound
    private var setCurrentRoundCallsCount = 0
    /// Число вызовов функции setScore
    private var setScoreCallsCount = 0
    /// Число вызовов функции setImages
    private var setImagesCallsCount = 0
    /// Число вызовов функции performSlide
    private var performSlideCallsCount = 0
    /// Число вызовов функции showAlert
    private var showAlertCallsCount = 0
    
    
    func setCurrentWord(word: String) {
        setCurrentWordCallsCount += 1
    }
    
    func setCurrentTeam(name: String) {
        setCurrentTeamCallsCount += 1
    }
    
    func setTimeLeft(timeLeft: String) {
        setTimeLeftCallsCount += 1
    }
    
    func setCurrentRound(number: Int) {
        setCurrentRoundCallsCount += 1
    }
    
    func setScore(_ score: Int) {
        setScoreCallsCount += 1
    }
    
    func setImages(images: [UIImage?], animated: Bool) {
        setImagesCallsCount += 1
    }
    
    func performSlide(images: [UIImage?]) {
        performSlideCallsCount += 1
    }
    
    func showAlert(title: String, message: String, completion: @escaping () -> Void, destructive: (() -> Void)?) {
        showAlertCallsCount += 1
        destructive?()
    }
    
    
    /// Проверка числа вызовов функции setCurrentWord
    func verifySetCurrentWordCallsCount(block: (Int) -> Void) {
        block(setCurrentWordCallsCount)
    }
    
    /// Проверка числа вызовов функции setCurrentTeam
    func verifySetCurrentTeamCallsCount(block: (Int) -> Void) {
        block(setCurrentTeamCallsCount)
    }
    
    /// Проверка числа вызовов функции setTimeLeft
    func verifySetTimeLeftCallsCount(block: (Int) -> Void) {
        block(setTimeLeftCallsCount)
    }
    
    /// Проверка числа вызовов функции setCurrentRound
    func verifySetCurrentRoundCallsCount(block: (Int) -> Void) {
        block(setCurrentRoundCallsCount)
    }
    
    /// Проверка числа вызовов функции setScore
    func verifySetScoreCallsCount(block: (Int) -> Void) {
        block(setScoreCallsCount)
    }
    
    /// Проверка числа вызовов функции setImages
    func verifySetImagesCallsCount(block: (Int) -> Void) {
        block(setImagesCallsCount)
    }
    
    /// Проверка числа вызовов функции performSlide
    func verifyPerformSlideCallsCount(block: (Int) -> Void) {
        block(performSlideCallsCount)
    }
    
    /// Проверка числа вызовов функции showAlert
    func verifyShowAlertCallsCount(block: (Int) -> Void) {
        block(showAlertCallsCount)
    }
    
}
