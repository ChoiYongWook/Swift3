//
//  ViewController.swift
//  textFieldSample
//
//  Created by YongWook Choi on 2017. 8. 24..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!

    @IBAction func closeAction(_ sender: Any) {
        bottom.constant = 0
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        bottom.constant = 300
        
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

