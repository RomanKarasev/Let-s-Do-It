//
//  UIApplication+ManagedContext.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import CoreData

extension UIApplication {

    var managedContext: NSManagedObjectContext? {
        guard let delegate = delegate as? AppDelegate
        else {
            return nil
        }

        return delegate.persistentContainer.viewContext
    }
}
