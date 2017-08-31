//
//  ViewController.swift
//  TextViewSample
//
//  Created by YongWook Choi on 2017. 8. 31..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let source = NSString(string: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
    
    @IBOutlet weak var bottom: NSLayoutConstraint!
    
    func handle(noti: Notification) {
        switch noti.name {
        case NSNotification.Name.UIKeyboardWillShow:
            
            if let keyboardSize = (noti.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                
                bottom.constant = keyboardSize.height
                
                UIView.animate(withDuration: 0.3, animations: { 
                    [weak self] in self?.view.layoutIfNeeded()
                })
            }
            
        case NSNotification.Name.UIKeyboardWillHide:
            
            bottom.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: { 
                [weak self] in self?.view.layoutIfNeeded()
            })
            
        default:
            break
        }
    }
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func search(_ sender: Any) {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let baseAttr = [NSFontAttributeName: UIFont.systemFont(ofSize: 17),
                        NSForegroundColorAttributeName: UIColor.black]
        
        let attrStr = NSMutableAttributedString(string: source as String)
        
        attrStr.addAttributes(baseAttr, range: NSRange(location: 0, length: source.length))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

