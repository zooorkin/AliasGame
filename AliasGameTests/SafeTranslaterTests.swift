//
//  SafeTranslaterTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 29/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest
@testable import AliasGame

//
//  Для тестирования SafeTranslater необходимо использование Host Application
//  Ввиду использования методов защиты от встраивания модуля в другие системы
//

class FakeNetworking: NetworkingProtocol {
    func getData(at path: URL, completion: @escaping (Data?) -> Void) {
        fatalError("[FakeNetworking]: метод getData не реализован")
    }
    
    weak var delegate: NetworkingDelegate?
    
    var session: URLSession = URLSession.shared
    
}

class SafeTranslaterTests: XCTestCase {
    
    var safeTranslater: SafeTranslater!

    override func setUp() {
        super.setUp()
        let fakeNetworking = FakeNetworking()
        safeTranslater = SafeTranslater.init(networking: fakeNetworking)
    }

    override func tearDown() {
        safeTranslater = nil
        super.tearDown()
    }

    func test_SafeTranslaterTranslatesAliasAsPsevdonim() {
        // Arrange
        let group = DispatchGroup()
        let word = "Alias"
        let expectedTranslation = "Псевдоним"

        // Act
        group.enter()
        safeTranslater.translate(englishWord: word) { (result) in
            
            let realTranslation: String
            
            switch result {
            case .success(let success): realTranslation = success
            case .failure: realTranslation = "Error"
            }
            // Assert
            XCTAssertEqual(realTranslation, expectedTranslation)
            group.leave()
        }
        group.wait()
    }
    
    func test_SafeTranslaterTranslatesHelloAsPrivet() {
        // Arrange
        let group = DispatchGroup()
        let word = "Hello"
        let expectedTranslation = "Привет"
        
        // Act
        group.enter()
        safeTranslater.translate(englishWord: word) { (result) in
            
            let realTranslation: String
            
            switch result {
            case .success(let success): realTranslation = success
            case .failure: realTranslation = "Error"
            }
            // Assert
            XCTAssertEqual(realTranslation, expectedTranslation)
            group.leave()
        }
        group.wait()
    }

}
