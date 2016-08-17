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
    
    var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let managedObjectContext = DataController.sharedInstance.managedObjectContext
    
    lazy var fetchRequest: NSFetchRequest<Item> = {
       
        // create request
        let request = NSFetchRequest<Item>(entityName: Item.identifier)
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }()
    
    // Fetched Results Controller of Type Item
    lazy var fetchedResultsController: NSFetchedResultsController<Item> = {
        
       let controller = NSFetchedResultsController(fetchRequest: self.fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        return controller
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            items = try managedObjectContext.fetch(fetchRequest) as [Item]
        } catch let error as NSError {
            print("Error Fetching Item Objects: \(error.localizedDescription), \(error.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell
        cell.textLabel?.text = items[indexPath.row].text

        return cell
    }
 

}
