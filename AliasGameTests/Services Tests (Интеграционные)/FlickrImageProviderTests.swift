//
//  FlickrImageProviderTests.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import XCTest

class FlickrImageProviderTests: XCTestCase {
    
    enum Existence {
        case exists
        case notExists
    }
    
    var flickrImageProvider: FlickrImageProvider!
    
    override func setUp() {
        super.setUp()
        let session = URLSession.shared
        let networking = Networking(session: session)
        flickrImageProvider = FlickrImageProvider(networking: networking)
    }
    
    override func tearDown() {
        flickrImageProvider = nil
        super.tearDown()
    }
    
    /// Метод getWords класса InternetWordsProvider вызывает метод wordsProviderDidGetWords свойства delegate один раз
    func testInternetWordsProviderGetWordsCallsDelegateWordsProviderDidGetWordsOneTime() {
        // Arrange
        let expectedResult: Existence = .exists
        // Act
        var realResult: Existence = .notExists
        flickrImageProvider.getImage(with: "apple") { image in
            if let _ = image {
                realResult = .exists
            }
        }
        sleep(3)
        // Assert
        XCTAssertEqual(realResult, expectedResult, "Неудалось загрузить картинку, возможно проблема в интернете")
    }
    
    
}
