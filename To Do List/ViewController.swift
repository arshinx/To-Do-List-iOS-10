//
//  ViewController.swift
//  To Do List
//
//  Created by Arshin Jain on 7/28/16.
//  Copyright © 2016 Arshin Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //
    @IBOutlet weak var textField: UITextField!
    
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
        
        // Dismiss View Controller
        dismiss(animated: true, completion: nil)
    }

}

