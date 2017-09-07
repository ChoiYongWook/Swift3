//
//  DetailViewController.swift
//  MemoSample_1
//
//  Created by YongWook Choi on 2017. 9. 7..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memo: Memo?
    
    @IBOutlet weak var contentView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let momo = memo {
            title = momo.title
            contentView.text = momo.content
        }
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
