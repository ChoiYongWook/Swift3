//
//  MultiPickerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class MultiPickerSampleViewController: UIViewController {
    
    let si = ["서울시"]
    let gu = [["강남구", "서초구"]]
    let dong = [["삼성동", "논현동", "청담동"],
                ["서초동", "방배동", "반포동"]]
    
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}


extension MultiPickerSampleViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return si.count
        case 1:
            return gu[pickerView.selectedRow(inComponent: 0)].count
        case 2:
            return dong[pickerView.selectedRow(inComponent: 1)].count
        default:
            return 0
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
}


extension MultiPickerSampleViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return si[row]
        case 1:
            return gu[pickerView.selectedRow(inComponent: 0)][row]
        case 2:
            return dong[pickerView.selectedRow(inComponent: 1)][row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 1:
            pickerView.reloadComponent(2)
        default:
            break
        }
        
        let selectedSi = si[pickerView.selectedRow(inComponent: 0)]
        let selectedGu = gu[pickerView.selectedRow(inComponent: 0)][pickerView.selectedRow(inComponent: 1)]
        let selectedDong = dong[pickerView.selectedRow(inComponent: 1)][pickerView.selectedRow(inComponent: 2)]
        
        valueLabel.text = "\(selectedSi) \(selectedGu) \(selectedDong)"
    }
}
