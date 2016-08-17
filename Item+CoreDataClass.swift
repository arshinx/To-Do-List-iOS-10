//
//  Item+CoreDataClass.swift
//  To Do List
//
//  Created by Arshin Jain on 8/5/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    // Add property for simplified and easy access
    
    static let identifier = "Item"

    static let fetchRequest: NSFetchRequest<Item> = {
        
        // create request
        let request = NSFetchRequest<Item>(entityName: Item.identifier)
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }()
    

}
