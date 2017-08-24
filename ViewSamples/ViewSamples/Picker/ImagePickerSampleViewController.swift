//
//  ImagePickerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ImagePickerSampleViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var images: [UIImage] = {
        var list = [UIImage]()
        for num in 1...8 {
            guard let image = UIImage(named: "fruit\(num)") else { continue }
            list.append(image)
        }
        
        return list
    }()
    
    
    @IBAction func shuffle(_ sender: Any?) {
        let firstIndex = Int(arc4random_uniform(UInt32(images.count))) + 50
        let secondIndex = Int(arc4random_uniform(UInt32(images.count))) + 50
        let thirdIndex = Int(arc4random_uniform(UInt32(images.count))) + 50
        
        pickerView.selectRow(firstIndex, inComponent: 0, animated: true)
        pickerView.selectRow(secondIndex, inComponent: 1, animated: true)
        pickerView.selectRow(thirdIndex, inComponent: 2, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.reloadAllComponents()
        shuffle(nil)
    }
}


extension ImagePickerSampleViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
}


extension ImagePickerSampleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let imgView = view as? UIImageView {
            imgView.image = images[row % images.count]
            return imgView
        }
        
        let imgView = UIImageView()
        imgView.image = images[row % images.count]
        imgView.contentMode = .scaleAspectFit
        
        return imgView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
}
