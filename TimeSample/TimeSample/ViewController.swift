//
//  ViewController.swift
//  TimeSample
//
//  Created by YongWook Choi on 2017. 9. 7..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!

    var timer = DispatchSource.makeTimerSource(flags:[], queue: DispatchQueue.main)
    
    func updateTime(){
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        timerLabel.text = formatter.string(from: now)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTime()
        
        timer.scheduleRepeating(deadline: .now(), interval: .seconds(1))
        timer.setEventHandler {
            self.updateTime()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timer.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.cancel()
    }


}

