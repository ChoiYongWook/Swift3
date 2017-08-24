//
//  TimerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 6..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TimerSampleViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    
    func updateTime() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        timeLabel.text = formatter.string(from: now)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateTime()
        
        timer.scheduleRepeating(deadline: .now(), interval: .seconds(1))
        timer.setEventHandler { [weak self] in
            self?.updateTime()
        }
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
