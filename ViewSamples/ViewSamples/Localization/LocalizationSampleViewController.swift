//
//  LocalizationSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 6..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class LocalizationSampleViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var localizedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueLabel.text = "안녕하세요"
        localizedLabel.text = NSLocalizedString("안녕하세요", comment: "안녕하세요")
    }
}
