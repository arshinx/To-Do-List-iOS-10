//
//  DataSource.swift
//  TodoList
//
//  Created by Pasan Premaratne on 6/27/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataSource: NSObject, UITableViewDataSource {
    
    fileprivate let tableView: UITableView
    
    let managedObjectContext = DataController.sharedInstance.managedObjectContext
    
    lazy var fetchedResultsController: TodoFetchedResultsController = {
        let controller = TodoFetchedResultsController(managedObjectContext: self.managedObjectContext, withTableView: self.tableView)
        return controller
    }()
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func objectAtIndexPath(_ indexPath: IndexPath) -> NSManagedObject {
        return fetchedResultsController.object(at: indexPath) as! NSManagedObject
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return configureCell(cell, atIndexPath: indexPath)
    }
    
    fileprivate func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexPath) as! Item
        cell.textLabel?.text = item.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = fetchedResultsController.object(at: indexPath) as! NSManagedObject
        managedObjectContext.delete(item)
        DataController.sharedInstance.saveContext()
    }
    
}




























