//
//  GCDViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 6..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func performOnMainQueue(_ sender: Any) {
        var sum = 0
        for num in 1...100 {
            sum += num
            resultLabel.text = "\(sum)"
            Thread.sleep(forTimeInterval: 0.1)
        }
        
        resultLabel.text = "\(sum)"
    }
    
    @IBAction func performOnGlobalQueue(_ sender: Any) {
        DispatchQueue.global().async { [weak self] in
            var sum = 0
            for num in 1...100 {
                sum += num
                
                DispatchQueue.main.async {
                    self?.resultLabel.text = "\(sum)"
                }
                
                Thread.sleep(forTimeInterval: 0.1)
            }
            
            DispatchQueue.main.async {
                self?.resultLabel.text = "\(sum)"
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { 
                self?.resultLabel.text = "0"
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
