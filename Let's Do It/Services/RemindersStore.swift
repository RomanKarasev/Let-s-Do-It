//
//  RemindersStore.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import CoreData
import UIKit

protocol RemindersStoreInput: AnyObject {

    func create(
        reminder: Reminder,
        _ completion: @escaping (Reminder?, Error?) -> Void
    )

    func getReminders(
        _ completion: @escaping ([Reminder]?, Error?) -> Void
    )

    func edit(note: Reminder)

    func delete(
        note: Reminder,
        _ completion: @escaping (Reminder?, Error?) -> Void
    )

}

final class RemindersStore: RemindersStoreInput {

    private let coreDataService: CoreDataServiceInput

    private var managedContext: NSManagedObjectContext? {
        UIApplication.shared.managedContext
    }

    init(coreDataService: CoreDataServiceInput) {
        self.coreDataService = coreDataService
    }

    func create(
        reminder: Reminder,
        _ completion: @escaping (Reminder?, Error?) -> Void
    ) {
        // TODO: - допилить обработку ошибок
        guard let managedContext = managedContext else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        coreDataService.create(
            object: reminder,
            in: managedContext,
            completion: { reminder, error  in
                guard let reminder = reminder else {
                    completion(nil, nil)
                    return
                }
                completion(reminder, CoreDataError.couldNotSaveReminder)
            }
        )
    }

    func getReminders(
        _ completion: @escaping ([Reminder]?, Error?) -> Void
    ) {
        guard let managedContext = managedContext
        else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        let request = Reminder.fetchRequest()

        // TODO: - допилить обработку ошибок
        coreDataService.read(with: request, in: managedContext) { reminders, error in
            guard let reminders = reminders else {
                completion(nil, CoreDataError.couldNotGetReminder)
                return
            }
            completion(reminders, nil)
        }
    }

    func edit(note: Reminder) {
    }

    func delete(
        note: Reminder,
        _ completion: @escaping (Reminder?, Error?) -> Void
    ) {
        guard let managedContext = managedContext
        else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        coreDataService.delete(
            object: note,
            in: managedContext
        ) { reminder, error in
            guard let reminder = reminder
            else {
                completion(nil, CoreDataError.couldNotDeleteReminder)
                return
            }
            
            completion(reminder, nil)
        }
    }
}

