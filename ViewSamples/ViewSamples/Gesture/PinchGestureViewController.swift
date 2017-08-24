//
//  PinchGestureViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class PinchGestureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var scale: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func hadlePinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .ended {
            scale = sender.scale
        } else if sender.state == .began && scale != 0.0 {
            sender.scale = scale
        }
        
        if !sender.scale.isNaN && sender.scale != 0.0 {
            imageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }
    }

}
