//
//  TextViewSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class TextViewSampleViewController: UIViewController {
    
    let source = NSString(string: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
    
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var inputField: UITextField!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    
    @IBAction func searchKeyword(_ sender: Any) {
        defer {
            inputField.resignFirstResponder()
        }
        
        guard let keyword = inputField.text, keyword.characters.count > 0 else {
            return
        }
        
        let baseAttr = [NSFontAttributeName: UIFont.systemFont(ofSize: 17),
                        NSForegroundColorAttributeName: UIColor.black]
        
        let attr = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17),
                    NSForegroundColorAttributeName: UIColor.red]
        let attrStr = NSMutableAttributedString(string: source as String)
        attrStr.addAttributes(baseAttr, range: NSRange(location: 0, length: source.length))
        
        var range = NSRange(location: 0, length: source.length)
        var foundRange = NSRange(location: NSNotFound, length: 0)
        while range.location < source.length {
            range.length = source.length - range.location
            foundRange = source.range(of: keyword, options: [], range: range)
            
            if foundRange.location != NSNotFound {
                attrStr.addAttributes(attr, range: foundRange)
                
                range.location = foundRange.location + foundRange.length
            } else {
                break
            }
        }
        
        textView.attributedText = attrStr
    }
    
    
    func handleNotification(noti: Notification) {
        switch noti.name {
        case NSNotification.Name.UIKeyboardWillShow:
            if let keyboardSize = (noti.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                bottomConstraint.constant = keyboardSize.height
                
                UIView.animate(withDuration: 0.3, animations: { [weak self] in
                    self?.view.layoutIfNeeded()
                })
            }
        case NSNotification.Name.UIKeyboardWillHide:
            bottomConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.view.layoutIfNeeded()
            })
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomConstraint.constant = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

}


extension TextViewSampleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputField.resignFirstResponder()
        
        return true
    }
}
