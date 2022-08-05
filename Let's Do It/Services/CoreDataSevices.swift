//
//  CoreDataSevices.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import CoreData

// MARK: - CoreDataError

enum CoreDataError: Error {

    /// General

    case couldNotLoadContext

    /// Reminders

    case couldNotSaveReminder
    case couldNotGetReminder
    case couldNotDeleteReminder
    
    
    /// Notes
    
    case couldNotSaveNote
    case couldNotGetNote
    case couldNotDeleteNote
    
    
    /// Habit

    case couldNotSaveHabit
    case couldNotGetHabit
    case couldNotDeleteHabit
    
}

// MARK: - CoreDataServiceInput

protocol CoreDataServiceInput: AnyObject {

    func create<T: NSManagedObject>(
        object: T,
        in context: NSManagedObjectContext,
        completion: @escaping (T?, Error?) -> Void
    )

    func read<T: NSManagedObject>(
        with request: NSFetchRequest<T>,
        in context: NSManagedObjectContext,
        completion: @escaping ([T]?, Error?) -> Void
    )

    func delete<T: NSManagedObject>(
        object: T,
        in context: NSManagedObjectContext,
        completion: @escaping (T?, Error?) -> Void
    )

    func upadte<T: NSManagedObject>(
        object: T,
        in context: NSManagedObjectContext,
        completion: @escaping (T?, Error?) -> Void
    )
}

// MARK: - <CoreDataServiceInput> Conformance

final class CoreDataService: CoreDataServiceInput {

    func create<T>(
        object: T,
        in context: NSManagedObjectContext,
        completion: @escaping (T?, Error?) -> Void
    ) where T : NSManagedObject {
        do {
            try context.save()
            completion(object, nil)
        } catch let error as NSError {
            completion(nil, error)
        }
    }

    func read<T>(
        with request: NSFetchRequest<T>,
        in context: NSManagedObjectContext,
        completion: @escaping ([T]?, Error?) -> Void
    ) where T : NSManagedObject {
        do {
            let objects = try context.fetch(request)
            completion(objects, nil)
        } catch let error as NSError {
            completion(nil, error)
        }
    }

    func delete<T>(
        object: T,
        in context: NSManagedObjectContext,
        completion: @escaping (T?, Error?) -> Void
    ) where T : NSManagedObject {
        do {
            context.delete(object)
            try context.save()
            completion(object, nil)
        } catch let error as NSError {
            completion(nil, error)
        }
    }

    func upadte<T>(
        object: T,
        in context: NSManagedObjectContext,
        completion: @escaping (T?, Error?) -> Void
    ) where T : NSManagedObject {
//        do {
//            let objects = try context?.fetch(request)
//            completion(objects, nil)
//        } catch let error as NSError {
//            completion(nil, error)
//        }
    }
}
