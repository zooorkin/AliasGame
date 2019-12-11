//
//  AboutInteractor.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol AboutInteractorInput {
    
    var output: AboutInteractorOutput? { get set }
    
    var text: String { get }
    
    var title: String { get }
    
}

protocol AboutInteractorOutput: class {
    
}

class AboutInteractor: AboutInteractorInput {
    
    weak var output: AboutInteractorOutput?
    
    let text = "Alias – игра для iPhone, в которой участникам предлагается поочередно или объяснять появляющиеся слова, или отгадывать их.\n\nПриложение является выпускным проектом в Сбербанк iOS школе.\n\nАвтор: Зорькин Андрей"
    
    let title = "Об игре"

    
}
