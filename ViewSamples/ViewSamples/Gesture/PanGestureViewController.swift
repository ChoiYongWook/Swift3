//
//  PanGestureViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class PanGestureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        
        if sender.state != .ended && sender.state != .failed {
            let loc = sender.location(in: view)
            imageView.center = loc
        }
        
    }

}
