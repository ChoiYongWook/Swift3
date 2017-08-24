//
//  SwitchSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class SwitchSampleViewController: UIViewController {

    @IBOutlet weak var bulbImageView: UIImageView!
    
    @IBOutlet weak var bulbSwitch: UISwitch!
    
    func updateBulbImage() {
        let image = UIImage(named: "bulb")
        if bulbSwitch.isOn {
            bulbImageView.image = image
        } else {
            bulbImageView.image = image?.withRenderingMode(.alwaysTemplate)
            bulbImageView.tintColor = UIColor.darkGray
        }
    }
    
    @IBAction func switchUpdated(_ sender: Any) {
        updateBulbImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateBulbImage()
    }
}
