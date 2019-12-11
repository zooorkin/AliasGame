//
//  StubAboutInteractor.swift
//  AliasGameTests
//
//  Created by Андрей Зорькин on 11/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
@testable import AliasGame

class StubAboutInteractor: AboutInteractorInput {
    
    var text: String {
        return ""
    }
    
    var title: String {
        return ""
    }
    
    
    var output: AboutInteractorOutput?
    
}
