//
//  CountDownTimerSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 26..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class CountDownTimerSampleViewController: UIViewController {

    @IBOutlet weak var picker: UIDatePicker!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func timerChanged(_ sender: UIDatePicker) {
        valueLabel.text = "\(sender.countDownDuration) secs"
    }
    
    
    @IBAction func scheduleLocalNotification(_ sender: Any) {
        let seconds = picker.countDownDuration
        
        let noti = UILocalNotification()
        noti.alertTitle = "Attention!!!"
        noti.alertBody = "Lorem ipsum dolar amet sit"
        noti.applicationIconBadgeNumber = 123
        noti.fireDate = Date(timeIntervalSinceNow: seconds)
        
        UIApplication.shared.scheduleLocalNotification(noti)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.countDownDuration = 60
        valueLabel.text = "\(picker.countDownDuration) secs"
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
    }


}
