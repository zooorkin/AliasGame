//
//  Word+CoreDataProperties.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 01/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//
//

import Foundation
import CoreData

extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var languageData: Int32
    @NSManaged public var categoryData: Int32
    @NSManaged public var wordData: String?

}
