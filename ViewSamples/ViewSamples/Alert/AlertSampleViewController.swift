//
//  AlertSampleViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 1. 24..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit

class AlertSampleViewController: UIViewController {

    @IBAction func show1Alert(_ sender: Any) {
        let alert = UIAlertController(title: "title", message: "Lorem Ipsum Dolar sit amet", preferredStyle: .alert)
        
        let positiveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action.title)
        }
        
        alert.addAction(positiveAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func show2Alert(_ sender: Any) {
        let alert = UIAlertController(title: "title", message: "Lorem Ipsum Dolar sit amet", preferredStyle: .alert)
        
        let positiveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action.title)
        }
        
        alert.addAction(positiveAction)
        
        let negativeAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print(action.title)
        }
        
        alert.addAction(negativeAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func show3Alert(_ sender: Any) {
        let alert = UIAlertController(title: "title", message: "Lorem Ipsum Dolar sit amet", preferredStyle: .alert)
        
        let positiveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action.title)
        }
        
        alert.addAction(positiveAction)
        
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
    
    @IBAction func showTextEntryAlert(_ sender: Any) {
        let alert = UIAlertController(title: "title", message: "Lorem Ipsum Dolar sit amet", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Input User Id"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Input Password"
            textField.isSecureTextEntry = true
        }
        
        let positiveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print(action.title)
            if let id = alert.textFields?.first {
                print(id.text)
            }
            
            if let password = alert.textFields?.last {
                print(password.text)
            }
        }
        
        alert.addAction(positiveAction)
        
        let negativeAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print(action.title)
        }
        
        alert.addAction(negativeAction)
        
        present(alert, animated: true, completion: nil)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
