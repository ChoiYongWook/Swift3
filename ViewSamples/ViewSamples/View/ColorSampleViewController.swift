//
//  ColorSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 25..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ColorSampleViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    @IBAction func sliderUpdated(_ sender: Any) {
        let r = CGFloat(rSlider.value)
        let g = CGFloat(gSlider.value)
        let b = CGFloat(bSlider.value)
        
        let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        targetView.backgroundColor = color
    }
    
    @IBAction func alphaChanged(_ sender: UISlider) {
        targetView.alpha = CGFloat(sender.value)
    }
    
    @IBAction func updateHiddenState(_ sender: UISwitch) {
        targetView.isHidden = sender.isOn
    }
    
    @IBAction func updateClipState(_ sender: UISwitch) {
        targetView.clipsToBounds = sender.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
