//
//  Habit + CoreDataProperties.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var date: String?
    @NSManaged public var dayCount: String?
    @NSManaged public var image: String?
}
