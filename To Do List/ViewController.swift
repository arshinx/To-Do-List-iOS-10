//
//  ViewController.swift
//  To Do List
//
//  Created by Arshin Jain on 7/28/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //
    @IBOutlet weak var textField: UITextField!
    let dataController = DataController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Actions
    @IBAction func cancel(_ sender: AnyObject) {
        
        // Dismiss View Controller
        dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: AnyObject) {
        
        guard let text = textField.text else { return }
        
        // Note: Changes have been noted in memory, not saved yet.
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: dataController.managedObjectContext) as! Item
        
        item.text = text
        
        // Dismiss View Controller
        dismiss(animated: true, completion: nil)
    }

}

