//
//  ButtonSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ButtonSampleViewController: UIViewController {
    
    @IBAction func showStyle(_ sender: UIButton) {
        let alert = UIAlertController(title: "Button Type", message: nil, preferredStyle: .alert)
        
        switch sender.buttonType {
        case .system:
            alert.message = "System"
        case .infoLight:
            alert.message = "Info Light"
        case .infoDark:
            alert.message = "Info Dark"
        case .detailDisclosure:
            alert.message = "Detail Disclosure"
        case .contactAdd:
            alert.message = "Contact Add"
        default:
            break
        }
        
        let positiveAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(positiveAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var stateButton: UIButton!
    
    
    @IBAction func updateState(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            stateButton.isHighlighted = false
            stateButton.isEnabled = true
        case 1:
            stateButton.isEnabled = true
            stateButton.isHighlighted = true            
        case 2:
            stateButton.isHighlighted = false
            stateButton.isEnabled = false
        default:
            break
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
