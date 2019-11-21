//
//  CoreDataStack.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol ICoreDataStack {

    var delegate: ICoreDataStackDelegate? { get set }

}


protocol ICoreDataStackDelegate {

}


class CoreDataStack: ICoreDataStack {

    var delegate: ICoreDataStackDelegate?

}
