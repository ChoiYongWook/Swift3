//
//  ViewController.swift
//  ProgressSample
//
//  Created by YongWook Choi on 2017. 8. 31..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bar: UIProgressView!
    
    var timer: Timer?

    @IBAction func start(_ sender: Any) {
        bar.progress = 0
        
        timer = Timer(timeInterval: 0.3, repeats: true, block: updateProgress(t:))
        
        RunLoop.current.add(timer!, forMode: .commonModes)
    }
    
    func updateProgress(t: Timer) {
        bar.progress += 0.1
        
        if bar.progress > 0.99 {
            timer?.invalidate()
            timer = nil
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

