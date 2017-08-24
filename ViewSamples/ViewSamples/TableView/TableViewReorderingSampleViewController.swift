//
//  TableViewReorderingSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TableViewReorderingSampleViewController: UIViewController {
    
    var stringList: [String] = {
        var list = [String]()
        for num in 1...10 {
            list.append("Item \(num)")
        }
        
        return list
    }()
    
    @IBOutlet weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.setEditing(true, animated: true)
    }

    

}


extension TableViewReorderingSampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let data = stringList[indexPath.row]
        cell.textLabel?.text = data
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let target = stringList.remove(at: sourceIndexPath.row)
        stringList.insert(target, at: destinationIndexPath.row)
        
        tableView.reloadData()
    }
}

extension TableViewReorderingSampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
