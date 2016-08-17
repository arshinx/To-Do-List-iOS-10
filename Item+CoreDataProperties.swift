//
//  Item+CoreDataProperties.swift
//  To Do List
//
//  Created by Arshin Jain on 8/5/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import Foundation
import CoreData

extension Item {

    /*
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }
     */

    @NSManaged public var completed: Bool
    @NSManaged public var text: String?

}
