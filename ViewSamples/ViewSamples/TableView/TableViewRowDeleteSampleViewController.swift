//
//  TableViewRowDeleteSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TableViewRowDeleteSampleViewController: UIViewController {
    
    var stringList: [String] = {
        var list = [String]()
        for num in 1...10 {
            list.append("Item \(num)")
        }
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TableViewRowDeleteSampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let data = stringList[indexPath.row]
        cell.textLabel?.text = data
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stringList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
