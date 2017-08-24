//
//  SliderSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class SliderSampleViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var defaultSlider: UISlider!
    
    
    @IBAction func sliderUpdated(_ sender: UISlider) {
        valueLabel.text = "\(sender.value)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueLabel.text = "\(defaultSlider.value)"
    }
}
