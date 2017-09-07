//
//  WhiteViewController.swift
//  MemoSample_1
//
//  Created by YongWook Choi on 2017. 9. 7..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

let MemoDidInsertNotification = Notification.Name("MemoDidInsertNotification")

class WhiteViewController: UIViewController {

    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    
    @IBAction func performClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func performSave(_ sender: Any) {
        guard let title = titleField.text else {
            return
        }
        guard let content = contentField.text else {
            return
        }
        
        let newMemo = Memo(title: title, content: content, date: Date())
        
        DispatchQueue.global().async {
            NotificationCenter.default.post(name: MemoDidInsertNotification, object: newMemo)
        }
        
        performClose(sender)
    }
    
    func handle(noti: Notification) {
        switch noti.name {
        case Notification.Name.UIKeyboardWillShow:
            
            bottom.constant = 300
            
            UIView.animate(withDuration: 0.3, animations: { 
                self.view.layoutIfNeeded()
            })
        case Notification.Name.UIKeyboardWillHide:
            bottom.constant = 8
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if titleField.isFirstResponder {
            titleField.resignFirstResponder()
        }
        
        if contentField.isFirstResponder {
            contentField.resignFirstResponder()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
