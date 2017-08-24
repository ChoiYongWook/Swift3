//
//  BlogEntity+CoreDataProperties.swift
//  ViewSamples
//
//  Created by Keun young Kim on 2017. 2. 7..
//  Copyright © 2017년 Keun young Kim. All rights reserved.
//

import Foundation
import CoreData


extension BlogEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BlogEntity> {
        return NSFetchRequest<BlogEntity>(entityName: "Blog");
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var date: NSDate?

}
