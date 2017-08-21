//
//  ListViewController.swift
//  MemoSample
//
//  Created by YongWook Choi on 2017. 8. 21..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var listTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row + 1)"
        if indexPath.row % 2 == 0 {
            cell.textLabel?.textAlignment = .center
        }else {
            cell.textLabel?.textAlignment = .left
        }
        
        print(indexPath.section)
        print(indexPath.row)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var tempIndex = 0
        if let cell = sender as? UITableViewCell{
            if let indexPath = listTableView.indexPath(for: cell){
                tempIndex = indexPath.row
            }
        }
        
        if let vc = segue.destination as? DetailViewController{
            vc.data = tempIndex
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
