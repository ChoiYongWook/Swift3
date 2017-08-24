//
//  DatePickerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class DatePickerSampleViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var valueLabel: UILabel!
    
    
    @IBAction func pickerModeChanged(_ sender: UISegmentedControl) {
        if let mode = UIDatePickerMode(rawValue: sender.selectedSegmentIndex) {
            datePicker.datePickerMode = mode
        }
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        switch datePicker.datePickerMode {
        case .date:
            formatter.dateStyle = .long
            formatter.timeStyle = .none
        case .time:
            formatter.dateStyle = .none
            formatter.timeStyle = .long
        case .dateAndTime:
            formatter.dateStyle = .long
            formatter.timeStyle = .long
        default:
            return
        }
        
        valueLabel.text = formatter.string(from: sender.date)
    }
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        formatter.timeZone = datePicker.timeZone
        formatter.locale = datePicker.locale
    }
}
