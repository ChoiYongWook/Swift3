//
//  SampleListTableViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class SampleListTableViewController: UITableViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            segue.destination.title = cell.textLabel?.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if navigationController!.viewControllers.count > 1 {
            navigationItem.title = "Table View & Collection View"
        } else {
            navigationItem.title = "Sample List"
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    

}
