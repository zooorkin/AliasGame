//
//  MockImageProvider.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class MockImageProvider: ImageProviderProtocol {
    
    var delegate: ImageProviderDelegate?
    
    func getImage(with text: String, completion: @escaping (UIImage?) -> Void) {
        completion(.init())
    }

}
