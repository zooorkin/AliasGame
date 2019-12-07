//
//  CoreDataStack.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataStackProtocol {

    var delegate: CoreDataStackDelegate? { get set }
    
    /// Shared-instance of Core Data Stack
    static var shared: CoreDataStack { get }
    
    /// Контекст для чтения данных из Core Data
    var readContext: NSManagedObjectContext { get }
    
    /// Контекст для записи данных в Core Data
    var writeContext: NSManagedObjectContext { get }

}


protocol CoreDataStackDelegate: class {

}


class CoreDataStack: CoreDataStackProtocol {

    weak var delegate: CoreDataStackDelegate?
    
    static var shared: CoreDataStack = CoreDataStack()
    
    var readContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    lazy var writeContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()

}
