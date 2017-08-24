//
//  ContentModeSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 25..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ContentModeSampleViewController: UIViewController {

    @IBOutlet weak var currentModeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    func updateContentModeName() {
        let modeNames = ["UIViewContentMode.scaleToFill",
                         "UIViewContentMode.scaleAspectFit",
                         "UIViewContentMode.scaleAspectFill",
                         "UIViewContentMode.redraw",
                         "UIViewContentMode.center",
                         "UIViewContentMode.top",
                         "UIViewContentMode.bottom",
                         "UIViewContentMode.left",
                         "UIViewContentMode.right",
                         "UIViewContentMode.topLeft",
                         "UIViewContentMode.topRight",
                         "UIViewContentMode.bottomLeft",
                         "UIViewContentMode.bottomRight"]
        
        currentModeLabel.text = modeNames[imageView.contentMode.rawValue]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.black.cgColor
        
        toggleSwitch.isOn = imageView.clipsToBounds
        
        updateContentModeName()
    }
    
    @IBAction func toggleClipsToBounds(sender: UISwitch) {
        imageView.clipsToBounds = sender.isOn
    }
    
    @IBAction func changeContentMode(sender: AnyObject) {
        var currentMode = imageView.contentMode.rawValue
        if currentMode == UIViewContentMode.bottomRight.rawValue {
            currentMode = 0
        } else {
            currentMode += 1
        }
        
        if let mode = UIViewContentMode(rawValue: currentMode) {
            imageView.contentMode = mode
        }
        
        updateContentModeName()
    }

}
