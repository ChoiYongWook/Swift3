//
//  ActionSheetSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class ActionSheetSampleViewController: UIViewController {

    @IBAction func showActionSheet(_ sender: Any) {
        let list = ["Apple", "Orange", "Banana"]
        
        let alert = UIAlertController(title: "title", message: "Lorem Ipsum Dolar sit amet", preferredStyle: .actionSheet)
        
        for title in list {
            let positiveAction = UIAlertAction(title: title, style: .default) { (action) in
                print(action.title)
            }
            
            alert.addAction(positiveAction)
        }
        
        
        let negativeAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print(action.title)
        }
        
        alert.addAction(negativeAction)
        
        let otherAction = UIAlertAction(title: "Other", style: .destructive) { (action) in
            print(action.title)
        }
        
        alert.addAction(otherAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
