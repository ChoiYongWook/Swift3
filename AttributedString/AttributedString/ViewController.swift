//
//  ViewController.swift
//  AttributedString
//
//  Created by YongWook Choi on 2017. 8. 28..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var imageBtn: UIButton!
    
    @IBAction func loadingStop(_ sender: Any) {
//        if (loading.isAnimating){
//            loading.stopAnimating()
//        }else {
//            loading.startAnimating()
//        }
//        
//        loading.color = UIColor(red: 120/255.0, green: 50/225.0, blue: 130/255.0, alpha: 1.0)
        
//        let sheet = UIAlertController(title: "Start", message: "Stop", preferredStyle: .alert)
        
        let sheet = UIAlertController(title: "AlertController", message: "UIAlertAction", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Start", style: .default) { (act) in
            self.loading.startAnimating()
        }
        sheet.addAction(action1)
        
        let action2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(action2)
        
        let action3 = UIAlertAction(title: "Strop", style: .destructive){ (act) in
            self.loading.stopAnimating()
        }
        sheet.addAction(action3)
        
        show(sheet, sender: nil)
    }
    
    @IBAction func toggle(_ sender: Any) {
        //버튼으로 버튼 state 토글 시키기
//        imageBtn.state = UIControlState.disabled
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if let title = sender.titleForSegment(at: index) {
            print(title)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sampleLabel.text = "Lorem Ipsum"
        
        guard let str = sampleLabel.text, str.characters.count > 0 else {
            return
        }
        
        let nsstr = NSString(string: str)
        let nsrange = nsstr.range(of: "Ipsum")
        if nsrange.location != NSNotFound {
            let attr = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName:UIColor.red]
            
            let attrStr = NSMutableAttributedString(string: str)
            attrStr.addAttributes(attr, range: nsrange)
            sampleLabel.attributedText = attrStr
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

