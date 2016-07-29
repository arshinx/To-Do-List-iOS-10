//
//  CoreDataStack.swift
//  To Do List
//
//  Created by Arshin Jain on 7/28/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import Foundation
import CoreData

class DataController: Object {
    
    private lazy var applicationDocumentsDirectory: URL = {
        
        // let urls = FileManager.default().urlsForDirectory(directory: .documentDirectory, domainMask: .userDomainMask)
        let urls = FileManager.defaultManager().URLsForDirectory(.documentDirectory, inDomains: .userDomainMask)
        
        // return highest index - 1
        return urls[urls.endIndex.predecessor]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = Bundle.mainBundle().URLForResource("TodoList", withExtension: "momd")!
        
        // Force Unwrap, crash when unable to load
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    // Persistent Store Coordinator
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
    }
    
    
}
