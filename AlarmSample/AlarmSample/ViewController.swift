//
//  ViewController.swift
//  AlarmSample
//
//  Created by YongWook Choi on 2017. 9. 4..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var picker: UIDatePicker!
    
    
    @IBAction func schedule(_ sender: Any) {
        let seconds = picker.countDownDuration
        
        let noti = UILocalNotification()
        noti.alertTitle = "Attention!!"
        noti.alertBody = "Lorem ipsum dolar amet sit"
        noti.applicationIconBadgeNumber = 123
        noti.fireDate = Date(timeIntervalSinceNow: 10)
        
        UIApplication.shared.scheduleLocalNotification(noti)
    }

    func handle(noti: Notification){
        if let obj = noti.object as? [String: String] {
            guard let title = obj["title"] else { return }
            guard let body = obj["body"] else { return }
            
            let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle(noti:)), name: AlarmDidReceive, object: nil)
        
        UIApplication.shared.applicationIconBadgeNumber = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

