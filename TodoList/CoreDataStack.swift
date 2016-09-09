//
//  CoreDataStack.swift
//  TodoList
//
//  Created by Pasan Premaratne on 6/15/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import CoreData

open class DataController: NSObject {
    
    static let sharedInstance = DataController()
    
    fileprivate override init() {}
    
    fileprivate lazy var applicationDocumentsDirectory: URL = {
       let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[(urls.endIndex - 1)]
    }()
    
    fileprivate lazy var managedObjectModel: NSManagedObjectModel = {
       let modelURL = Bundle.main.url(forResource: "TodoList", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    fileprivate lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("TodoList.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            let userInfo: [String: AnyObject] = [
                NSLocalizedDescriptionKey: "Failed to initialize the application's saved data" as AnyObject,
                NSLocalizedFailureReasonErrorKey: "There was an error creating or loading the application's saved data" as AnyObject,
                NSUnderlyingErrorKey: error as NSError
            ]
            
            let wrappedError = NSError(domain: "com.teamtreehouse.CoreDataError", code: 9999, userInfo: userInfo)
            print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    open lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = coordinator
        
        return managedObjectContext
    }()
    
    open func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}





































