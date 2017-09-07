//
//  ViewController.swift
//  QueueSample
//
//  Created by YongWook Choi on 2017. 9. 7..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func performOnMain(_ sender: Any) {
        var sum = 0
        for num in 1...100 {
            sum += num
            resultLabel.text = "\(sum)"
            Thread.sleep(forTimeInterval: 0.1)
        }
        
        resultLabel.text = "\(sum)"
    }
    
    @IBAction func performOnFlobal(_ sender: Any) {
        DispatchQueue.global().async {
            //Non-UI Code
            var sum = 0
            for num in 1...100 {
                sum += num
                DispatchQueue.main.async {
                    //UI Code
                    self.resultLabel.text = "\(sum)"
                }
                Thread.sleep(forTimeInterval: 0.1)
            }

            DispatchQueue.main.async {
                self.resultLabel.text = "\(sum)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

