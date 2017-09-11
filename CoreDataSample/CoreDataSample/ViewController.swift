//
//  ViewController.swift
//  CoreDataSample
//
//  Created by YongWook Choi on 2017. 9. 11..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    @IBAction func onSave(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        
        let newMember = NSEntityDescription.insertNewObject(forEntityName: "Member", into: context) as! Member
        
        newMember.name = "James"
        newMember.age = Int16(arc4random_uniform(50) + 25)
        newMember.date = Date() as NSDate
        
        do{
            try context.save()
        } catch {
            print(error)
        }
    }

    @IBAction func performRead(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Member")
        
        let sortByAge = NSSortDescriptor(key: "age", ascending: true)
        
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        
        request.sortDescriptors = [sortByAge, sortByName]
        
        let predicate = NSPredicate(format: "name CONTAINS %@", NSString(string:"J"))
        
        request.predicate = predicate
        
        do{
            let result = try context.fetch(request) as! [Member]
            
            for data in result {
                print(data.name!, data.age, data.date!)
            }
            
//            print(result)
        }catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

