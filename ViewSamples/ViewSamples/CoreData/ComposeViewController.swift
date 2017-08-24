//
//  ComposeViewController.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 7..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreData

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!

    @IBAction func performClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func performSave(_ sender: Any) {
        guard let title = titleTextField.text, title.characters.count > 0 else {
            return
        }
        
        guard let content = contentTextView.text, content.characters.count > 0 else {
            return
        }
        
        guard let ctx = CoreDataManager.shared.managedObjectContext else {
            return
        }
        
        if let data = NSEntityDescription.insertNewObject(forEntityName: "Blog", into: ctx) as? BlogEntity {
            data.title = title
            data.content = content
            data.date = NSDate()
            
            do {
                try ctx.save()
                performClose(sender)
            } catch {
                print("error")
            }
        }
    }

}
