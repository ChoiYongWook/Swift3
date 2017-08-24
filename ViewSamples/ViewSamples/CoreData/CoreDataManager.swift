//
//  CoreDataManager.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 7..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {
        
    }
    
    var modelName: String!
    var useLightweightMigration = true
    var storeType = NSSQLiteStoreType
    
    func setupCoreData(modelName name: String, storeType type: String = NSSQLiteStoreType, useLightweightMigration useMigration: Bool = true) {
        modelName = name
        useLightweightMigration = useMigration
        storeType = type
    }
    
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        assert(self.modelName != nil, "EMPTY CORE DATA MODEL NAME: use setupCoreData()")
        
        let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        assert(self.modelName != nil, "EMPTY CORE DATA MODEL NAME: use setupCoreData()")
        
        var coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("\(self.modelName).sqlite")
        do {
            var options: [AnyHashable: Any]? = nil
            if self.useLightweightMigration {
                options = [NSMigratePersistentStoresAutomaticallyOption:NSNumber(value: true as Bool),
                           NSInferMappingModelAutomaticallyOption:NSNumber(value: true as Bool)]
            }
            
            try coordinator.addPersistentStore(ofType: self.storeType, configurationName: nil, at: url, options: options)
        } catch {
            abort()
        }
        
        return coordinator
    }()
    
        
    lazy var managedObjectContext: NSManagedObjectContext? = {
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
}
