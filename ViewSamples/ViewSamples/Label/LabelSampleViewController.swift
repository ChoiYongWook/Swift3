//
//  LabelSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class LabelSampleViewController: UIViewController {
    
    @IBOutlet weak var staticLabel: UILabel!
    
    @IBAction func updateTextAlignment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            staticLabel.textAlignment = .left
        case 1:
            staticLabel.textAlignment = .center
        case 2:
            staticLabel.textAlignment = .right
        default:
            break
        }
        
//        if let align = NSTextAlignment(rawValue: sender.selectedSegmentIndex) {
//            staticLabel.textAlignment = align
//        }
    }

    
    @IBOutlet weak var sampleLabel: UILabel!
    
    @IBAction func applyAttributedString(_ sender: Any) {
        guard let str = sampleLabel.text else {
            return
        }
        
        let nsstr = NSString(string: str)
        let nsrange = nsstr.range(of: "Ipsum")
        if nsrange.location != NSNotFound {
            let attr = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30),
                        NSForegroundColorAttributeName: UIColor.red]
            
            let attrStr = NSMutableAttributedString(string: str)
            attrStr.addAttributes(attr, range: nsrange)
            
            sampleLabel.attributedText = attrStr
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
