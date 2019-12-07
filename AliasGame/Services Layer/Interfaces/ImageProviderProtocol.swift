//
//  ImageProviderProtocol.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 01/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol ImageProviderProtocol {
    
    var delegate: ImageProviderDelegate? { get set }
    
    func getImage(with text: String, completion: @escaping (UIImage?) -> Void )
    
}

protocol ImageProviderDelegate: class {
    
}
