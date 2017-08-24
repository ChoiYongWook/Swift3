//
//  TableViewSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TableViewSampleViewController: UIViewController {
    
    var stringList: [String] = {
        var list = [String]()
        for num in 1...100 {
            list.append("Item \(num)")
        }
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


extension TableViewSampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let data = stringList[indexPath.row]
        cell.textLabel?.text = data
        
        return cell
    }
}
