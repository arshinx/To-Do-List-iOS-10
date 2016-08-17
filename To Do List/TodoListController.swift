//
//  TodoListController.swift
//  To Do List
//
//  Created by Arshin Jain on 7/28/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import UIKit
import CoreData

class TodoListController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = DataController.sharedInstance.managedObjectContext
    
    // Fetched Results Controller of Type Item
    lazy var fetchedResultsController: TodoFetchedResultsController<Item> = {
        
        let controller = TodoFetchedResultsController(managedObjectContext: self.managedObjectContext, withTableView: self.tableView)
        return controller
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        
        return section.numberOfObjects
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Return Configured the cell
        return configureCell(cell: cell, atIndexPath: indexPath)
    }
    
    // Configure and Customize Cell
    private func configureCell(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        
        return cell
    }
    
    

}
