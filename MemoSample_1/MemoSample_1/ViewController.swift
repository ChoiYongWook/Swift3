//
//  ViewController.swift
//  MemoSample_1
//
//  Created by YongWook Choi on 2017. 9. 7..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

struct Memo {
    var title: String
    var content: String
    var date: Date
}

class ViewController: UIViewController, UITableViewDataSource {

    var list = [Memo]()
    let formatter = DateFormatter()
    @IBOutlet weak var listTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = indexPath.row
        let memo = list[index]
        
        cell.textLabel?.text = memo.title
        cell.detailTextLabel?.text = formatter.string(from: memo.date)
        
        return cell
    }
    
    func handle(noti: Notification) {
        if let memo = noti.object as? Memo {
            list.append(memo)
            
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            if let indexPath = listTableView.indexPathForSelectedRow {
                let index = indexPath.row
                let target = list[index]
                
                if let vc = segue.destination as? DetailViewController {
                    vc.memo = target
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: MemoDidInsertNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

