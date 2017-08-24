//
//  ActivityIndicatorSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ActivityIndicatorSampleViewController: UIViewController {
    
    @IBOutlet weak var redIndicator: UIActivityIndicatorView!
    @IBOutlet weak var blueIndicator: UIActivityIndicatorView!
    
    @IBAction func toggle(_ sender: UIButton) {
        if redIndicator.isAnimating {
            redIndicator.stopAnimating()
            blueIndicator.stopAnimating()
            
            sender.setTitle("Start", for: .normal)
        } else {
            redIndicator.startAnimating()
            blueIndicator.startAnimating()
            
            sender.setTitle("Stop", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
