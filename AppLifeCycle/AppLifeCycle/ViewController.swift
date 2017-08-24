//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by YongWook Choi on 2017. 8. 24..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var width: NSLayoutConstraint!
    
    @IBAction func showMsg(_ sender: Any) {
        centerY.constant = -10
        
        UIView.animate(withDuration: 0.2, animations: { 
            self.iconView.alpha = 1.0
            self.msgLabel.alpha = 1.0
            self.view.layoutIfNeeded()
        }) { (finished) in
            self.centerY.constant = 0
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        iconView.alpha = 0.0
        msgLabel.alpha = 0.0
        
        centerY.constant += 30
        //내가 원하는데로 제약이 업데이트가 안되면 아래 코드 실행 (외우기)
//        view.layoutIfNeeded()
        
        width.constant = 150
        height.constant = 150
        
        iconView.layer.cornerRadius = width.constant / 2
//        iconView.clipsToBounds = false
        iconView.layer.borderWidth = 10
        iconView.layer.borderColor = UIColor.red.cgColor
        
        view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

