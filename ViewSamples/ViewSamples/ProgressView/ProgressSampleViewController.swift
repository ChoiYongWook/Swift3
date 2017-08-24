//
//  ProgressSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 25..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ProgressSampleViewController: UIViewController {
    
    var timer: Timer?

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    @IBAction func startProgress(_ sender: Any) {
        progressView.progress = 0
        
        timer = Timer(timeInterval: 0.3, repeats: true, block: updateProgress(timer:))
        RunLoop.current.add(timer!, forMode: .commonModes)
        timer?.fire()
        
        startButton.isEnabled = false
        stopButton.isEnabled = !startButton.isEnabled
    }
    
    
    @IBAction func stopProgress(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        
        startButton.isEnabled = true
        stopButton.isEnabled = !startButton.isEnabled
    }
    
    
    
    func updateProgress(timer: Timer) {
        progressView.progress += 0.1
        
        if progressView.progress == 1 {
            stopProgress(stopButton)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.progress = 0
        stopProgress(stopButton)
    }
}
