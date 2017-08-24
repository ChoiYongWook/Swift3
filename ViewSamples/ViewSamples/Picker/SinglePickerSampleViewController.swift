//
//  SinglePickerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class SinglePickerSampleViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    let list = Locale.availableIdentifiers
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}


extension SinglePickerSampleViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}


extension SinglePickerSampleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = list[row]
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .long
        print(selected)
        formatter.locale = Locale(identifier: selected)
        print(formatter.locale)
        
        valueLabel.text = formatter.string(from: Date())
    }
}
