//
//  CustomTableViewCellSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

struct TableData {
    let image: UIImage
    let title: String
    let reviewCount: Int
    let photoCount: Int
    let commentCount: Int
    let phoneOrderAvailable: Bool
    let onlinePaymentAvailable: Bool
    let offlinePaymentAvailable: Bool
    let tip: Int
    let distance: Double
    
    init(title: String, imageName: String) {
        image = UIImage(named: imageName)!
        self.title = title
        reviewCount = Int(arc4random_uniform(100))
        photoCount = Int(arc4random_uniform(100))
        commentCount = Int(arc4random_uniform(100))
        phoneOrderAvailable = Int(arc4random_uniform(100)) % 2 == 0
        onlinePaymentAvailable = Int(arc4random_uniform(100)) % 2 == 0
        offlinePaymentAvailable = Int(arc4random_uniform(100)) % 2 == 0
        tip = Int(arc4random_uniform(10000))
        distance = Double(Int(arc4random_uniform(100)) + 2) / 10.0
    }
}

class CustomTableViewCellSampleViewController: UIViewController {
    
    var dataList: [TableData] = {
        var list = [TableData]()
        
        var data = TableData(title: "교촌치킨 서초점", imageName: "store1")
        list.append(data)
        
        data = TableData(title: "크리스피크림도넛 강남역점", imageName: "store2")
        list.append(data)
        
        data = TableData(title: "챔프키진", imageName: "store3")
        list.append(data)
        
        return list
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


extension CustomTableViewCellSampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        let data = dataList[indexPath.row]
        cell.compose(with: data)
        
        return cell
    }
}

extension CustomTableViewCellSampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let data = dataList[indexPath.row]
        dump(data)
    }
}
