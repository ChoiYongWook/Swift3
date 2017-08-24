//
//  RotationGestureViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class RotationGestureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var angle: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = CGAffineTransform.init(rotationAngle: angle + sender.rotation)
        
        if sender.state == .ended {
            angle += sender.rotation
        }
    }

}
