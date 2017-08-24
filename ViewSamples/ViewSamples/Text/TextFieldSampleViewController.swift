//
//  TextFieldSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TextFieldSampleViewController: UIViewController {

    @IBOutlet weak var firstField: UITextField!
    
    
    @IBAction func borderStyleChanged(_ sender: UISegmentedControl) {
        if let style = UITextBorderStyle(rawValue: sender.selectedSegmentIndex) {
            firstField.borderStyle = style
        }
    }
    
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var overlayField: UITextField!
    
    func addOverlayView() {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        btn.setImage(UIImage(named: "Search-50"), for: .normal)
        btn.addTarget(self, action: #selector(dummySearch), for: .touchUpInside)
        
        overlayField.leftView = btn
        overlayField.leftViewMode = .always
    }
    
    func dummySearch() {
        let alert = UIAlertController(title: "Search", message: "Lorem Ipsum Dolar sit amet", preferredStyle: .alert)
        
        let positiveAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(positiveAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var maxLengthField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addOverlayView()
    }
}

extension TextFieldSampleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstField {
            overlayField.becomeFirstResponder()
        } else if textField == overlayField {
            overlayField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == numberField {
            let charset = CharacterSet(charactersIn: "0123456789").inverted
            if string.characters.count > 0 {
                if let _ = string.rangeOfCharacter(from: charset) {
                    return false
                }
            }
        } else if textField == maxLengthField {
            if string.characters.count > 0 {
                let final = (textField.text ?? "") + string
                if final.characters.count > 7 {
                    return false
                }
            }
        }
        
        return true
    }
}
