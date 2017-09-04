//
//  ViewController.swift
//  SinglePicker
//
//  Created by YongWook Choi on 2017. 9. 4..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var imagePickerView: UIPickerView!
    let list: [UIImage] = {
        var imgList = [UIImage]()
        for index in 1...8 {
            let img = UIImage(named: "fruit\(index)")
            imgList.append(img!)
        }
        
        return imgList
    }()
    let list2 = ["Barcelona", "Messi", "Suarez", "Neymar"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10000
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let imgView = view as? UIImageView {
            imgView.image = list[row % list.count]
            return imgView
        }
        
        let imgView = UIImageView()
        imgView.image = list[row % list.count]
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }

    @IBAction func shuffle(_ sender: Any?) {
        let firstIndex = Int(arc4random_uniform(UInt32(list.count))) + 5000
        let secondIndex = Int(arc4random_uniform(UInt32(list.count))) + 5000
        let thirdIndex = Int(arc4random_uniform(UInt32(list.count))) + 5000
        
        imagePickerView.selectRow(firstIndex, inComponent: 0, animated: true)
        imagePickerView.selectRow(secondIndex, inComponent: 1, animated: true)
        imagePickerView.selectRow(thirdIndex, inComponent: 2, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imagePickerView.selectRow(5000, inComponent: 0, animated: false)
//        imagePickerView.selectRow(5000, inComponent: 1, animated: false)
//        imagePickerView.selectRow(5000, inComponent: 2, animated: false)
        
        //전화거는 코드///////////////////
        let tel = "010-0000-0000"
        let url = URL(string: tel)
        UIApplication.shared.open(url!)
        ///////////////////////////////
        
        shuffle(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

