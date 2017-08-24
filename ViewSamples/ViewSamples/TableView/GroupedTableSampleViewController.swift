//
//  GroupedTableSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class GroupedTableSampleViewController: UIViewController {
    
    var stringList: [String] = {
        var list = [String]()
        for num in 1...10 {
            list.append("Item \(num)")
        }
        
        return list
    }()
    
    @IBOutlet weak var listTableView: UITableView!
    
    func reloadTableView() {
        listTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshBtn = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(GroupedTableSampleViewController.reloadTableView))
        navigationItem.rightBarButtonItem = refreshBtn
    }
}


extension GroupedTableSampleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Int(arc4random_uniform(UInt32(10))) + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(arc4random_uniform(UInt32(stringList.count)))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let data = stringList[indexPath.row]
        cell.textLabel?.text = data
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Header #\(section)"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Section Footer #\(section)"
    }
}
