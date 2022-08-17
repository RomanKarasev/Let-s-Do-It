//
//  Reminder + CoreDataProperties.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var date: String?
    @NSManaged public var time: String?
//    @NSManaged public var status: String?
}
