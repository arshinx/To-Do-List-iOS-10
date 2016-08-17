//
//  TodoFetchedResultsController.swift
//  To Do List
//
//  Created by Arshin Jain on 8/16/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TodoFetchedResultsController: NSFetchedResultsController, NSFetchedResultsControllerDelegate {
    
    private let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, withTableView tableView: UITableView) {
        
        self.tableView = tableView
        
        super.init(fetchRequest: Item.fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
        
    }
    
    func tryFetch() {
        
        do {
            try performFetch()
        } catch let error as NSError {
            print("Unresolved Error: \(error), \(error.userInfo)")
        }
        
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
}
