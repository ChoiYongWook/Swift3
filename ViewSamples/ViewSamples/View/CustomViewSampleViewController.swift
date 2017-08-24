//
//  CustomViewSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class CustomViewSampleViewController: UIViewController {

    @IBOutlet weak var chart: DonutChart!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func updateValue(_ sender: UISlider) {
        chart.value = CGFloat(sender.value)
        print(chart.value)
        
        // ...
        chart.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chart.value = CGFloat(slider.value)
    }

}
