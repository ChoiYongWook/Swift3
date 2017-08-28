//
//  ViewController.swift
//  Assignment_1
//
//  Created by 최 용욱 on 2017. 8. 25..
//  Copyright © 2017년 최 용욱. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelBottom: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.alpha = 0
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 0.3) { 
            self.label.alpha = 1
            self.view.layoutIfNeeded()
        }
        return true
    }

    @IBAction func closeKeyboard(_ sender: Any) {
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3) {
            self.label.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
