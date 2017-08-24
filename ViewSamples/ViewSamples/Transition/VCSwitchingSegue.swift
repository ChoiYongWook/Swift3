//
//  VCSwitchingSegue.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 27..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class VCSwitchingSegue: UIStoryboardSegue {
    lazy var appDelegate: AppDelegate = {
        return UIApplication.shared.delegate as! AppDelegate
    }()
    
    
    override func perform() {
        appDelegate.window?.rootViewController = destination
        UIView.transition(with: appDelegate.window!, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
            
        }, completion: { (finished: Bool) -> Void in
            
        })
    }
}
