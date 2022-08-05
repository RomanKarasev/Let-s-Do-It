//
//  HabitsStore.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import CoreData
import UIKit

protocol HabitsStoreInput: AnyObject {

    func create(
        habit: Habit,
        _ completion: @escaping (Habit?, Error?) -> Void
    )

    func getHabits(
        _ completion: @escaping ([Habit]?, Error?) -> Void
    )

    func edit(habit: Habit)

    func delete(
        note: Habit,
        _ completion: @escaping (Habit?, Error?) -> Void
    )

}

final class HabitsStore: HabitsStoreInput {

    private let coreDataService: CoreDataServiceInput

    private var managedContext: NSManagedObjectContext? {
        UIApplication.shared.managedContext
    }

    init(coreDataService: CoreDataServiceInput) {
        self.coreDataService = coreDataService
    }

    func create(
        habit: Habit,
        _ completion: @escaping (Habit?, Error?) -> Void
    ) {
        // TODO: - допилить обработку ошибок
        guard let managedContext = managedContext else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        coreDataService.create(
            object: habit,
            in: managedContext,
            completion: { habit, error  in
                guard let habit = habit else {
                    completion(nil, nil)
                    return
                }
                completion(habit, CoreDataError.couldNotSaveHabit)
            }
        )
    }

    func getHabits(
        _ completion: @escaping ([Habit]?, Error?) -> Void
    ) {
        guard let managedContext = managedContext
        else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        let request = Habit.fetchRequest()

        // TODO: - допилить обработку ошибок
        coreDataService.read(with: request, in: managedContext) { habits, error in
            guard let habits = habits else {
                completion(nil, CoreDataError.couldNotGetHabit)
                return
            }
            completion(habits, nil)
        }
    }

    func edit(habit: Habit) {
    }

    func delete(
        note: Habit,
        _ completion: @escaping (Habit?, Error?) -> Void
    ) {
        guard let managedContext = managedContext
        else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        coreDataService.delete(
            object: note,
            in: managedContext
        ) { habit, error in
            guard let habit = habit
            else {
                completion(nil, CoreDataError.couldNotDeleteHabit)
                return
            }
            
            completion(habit, nil)
        }
    }
}

