//
//  CoreDataStack.swift
//  To Do List
//
//  Created by Arshin Jain on 7/28/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import Foundation
import CoreData

public class DataController: NSObject {
    
    private lazy var applicationDocumentsDirectory: URL = {
        
        // let urls = FileManager.default().urlsForDirectory(directory: .documentDirectory, domainMask: .userDomainMask)
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // return highest index - 1 <-> urls.endIndex.predecessor()
        return urls[urls.endIndex - 1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        // Model URL
        let modelURL = Bundle.main.url(forResource: "TodoList", withExtension: "momd")
        
        // Force Unwrap, crash when unable to load
        return NSManagedObjectModel(contentsOf: modelURL!)!
    }()
    
    // Persistent Store Coordinator
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            
        // Retrieve error and act accordingly
        do {
            // Where to save data -- persistent store
            let url = self.applicationDocumentsDirectory.appendingPathComponent("TodoList.sqlite")
            
            // Attempt
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
            
            // When Failed
        } catch {
            
            // User Info Dictionary
            let userInfo: [String: AnyObject] = [
                NSLocalizedDescriptionKey: "Failed to initializee the application's saved data",
                NSLocalizedFailureReasonErrorKey: "There was an error creating or loading the application's saved data",
                NSUnderlyingErrorKey: error as NSError
            ]
            
            let wrappedError = NSError(domain: "com.Arshin.CoreDataError", code: 9999, userInfo: userInfo)
            
            // Log Error
            print("Unresolved Error \(wrappedError), \(wrappedError.userInfo)")
            
            // Quit App
            abort()
        }
        
        return coordinator
    }()
    
    // Managed Object Context
    public lazy var managedObjectContext: NSManagedObjectContext = {
        
        // retrieve coordinator and create Managed Object Context
        let coordinator = self.persistentStoreCoordinator
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        return managedObjectContext
    }()
    
    // Save Function
    public func saveContext() {
        
        // If there are changes
        if managedObjectContext.hasChanges {
            
            // Since there may be errors, particularly with disk intensive operations, there is a throwing function
            do {
                
                // Attempt to Save Data
                try managedObjectContext.save()
                
            } catch {
                
            }
        }
    }
    
    
} // End Class






















