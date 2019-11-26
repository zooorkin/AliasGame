//
//  CoreDataStack.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol CoreDataStackProtocol {

    var delegate: CoreDataStackDelegate? { get set }

}


protocol CoreDataStackDelegate {

}


class CoreDataStack: CoreDataStackProtocol {

    var delegate: CoreDataStackDelegate?

}
