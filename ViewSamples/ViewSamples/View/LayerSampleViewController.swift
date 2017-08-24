//
//  LayerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 25..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class LayerSampleViewController: UIViewController {
    
    
    @IBOutlet weak var targetView: UIView!
    
    
    
    @IBAction func borderWidthUpdated(_ sender: UISlider) {
        targetView.layer.borderWidth = CGFloat(sender.value)
    }
    
    @IBAction func cornerRadiusUpdated(_ sender: UISlider) {
        targetView.layer.cornerRadius = CGFloat(sender.value)
    }
    
    @IBAction func toggleShadow(_ sender: UISwitch) {
        targetView.layer.shadowColor = sender.isOn ? UIColor.blue.cgColor : nil
        targetView.layer.shadowOpacity = sender.isOn ? 1.0 : 0.0
    }
    
    @IBAction func shadowOffsetUpdated(_ sender: UISlider) {
        targetView.layer.shadowOffset = CGSize(width: CGFloat(sender.value), height: CGFloat(sender.value))
    }
    
    @IBAction func shadowRadiusUpdated(_ sender: UISlider) {
        targetView.layer.shadowRadius = CGFloat(sender.value)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
