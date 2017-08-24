//
//  BlogListViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 7..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreData

class BlogListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    var list = [BlogEntity]()
    
    func loadData() {
        list.removeAll(keepingCapacity: true)
        
        let ctx = CoreDataManager.shared.managedObjectContext        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Blog")
        
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        
        if let result = try? ctx?.fetch(request), let resultList = result {
            for item in resultList {
                if let item = item as? BlogEntity {
                    self.list.append(item)
                }
            }
        }
        
        listTableView.reloadData()
    }
    
    func showComposeVC() {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case .some("DetailSegue"):
            if let cell = sender as? UITableViewCell, let indexPath = listTableView.indexPath(for: cell) {
                if let vc = segue.destination as? DetailViewController {
                    vc.data = list[indexPath.row]
                }
            }
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(BlogListViewController.showComposeVC))
        navigationItem.rightBarButtonItem = btn
        
        

        // Do any additional setup after loading the view.
        CoreDataManager.shared.setupCoreData(modelName: "BlogModel")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
}


extension BlogListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let data = list[indexPath.row]
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.date?.description
        
        return cell
    }
}
