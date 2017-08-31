//
//  ViewController.swift
//  SliderSample
//
//  Created by YongWook Choi on 2017. 8. 31..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bulbImageView: UIImageView!
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        
        let image = UIImage(named: "bulb")
        
        if sender.isOn {
            bulbImageView.image = image
        } else {
            bulbImageView.image = image?.withRenderingMode(.alwaysTemplate)
            
            bulbImageView.tintColor = UIColor.darkGray
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //Int로 출력 하기
        print(Int(sender.value))
        
        //R.G.B 로 value 가져와서 UIViewController의 Background를 변경하기 (UIColor)
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

