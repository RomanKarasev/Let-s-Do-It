//
//  NotesStore.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import CoreData
import UIKit

protocol NotesStoreInput: AnyObject {

    func create(
        note: Note,
        _ completion: @escaping (Note?, Error?) -> Void
    )

    func getNotes(
        _ completion: @escaping ([Note]?, Error?) -> Void
    )

    func edit(note: Note)

    func delete(
        note: Note,
        _ completion: @escaping (Note?, Error?) -> Void
    )

}

final class NotesStore: NotesStoreInput {

    private let coreDataService: CoreDataServiceInput

    private var managedContext: NSManagedObjectContext? {
        UIApplication.shared.managedContext
    }

    init(coreDataService: CoreDataServiceInput) {
        self.coreDataService = coreDataService
    }

    func create(
        note: Note,
        _ completion: @escaping (Note?, Error?) -> Void
    ) {
        // TODO: - допилить обработку ошибок
        guard let managedContext = managedContext else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        coreDataService.create(
            object: note,
            in: managedContext,
            completion: { note, error  in
                guard let note = note else {
                    completion(nil, nil)
                    return
                }
                completion(note, CoreDataError.couldNotSaveNote)
            }
        )
    }

    func getNotes(
        _ completion: @escaping ([Note]?, Error?) -> Void
    ) {
        guard let managedContext = managedContext
        else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        let request = Note.fetchRequest()

        // TODO: - допилить обработку ошибок
        coreDataService.read(with: request, in: managedContext) { notes, error in
            guard let notes = notes else {
                completion(nil, CoreDataError.couldNotGetNote)
                return
            }
            completion(notes, nil)
        }
    }

    func edit(note: Note) {
    }

    func delete(
        note: Note,
        _ completion: @escaping (Note?, Error?) -> Void
    ) {
        guard let managedContext = managedContext
        else {
            completion(nil, CoreDataError.couldNotLoadContext)
            return
        }

        coreDataService.delete(
            object: note,
            in: managedContext
        ) { note, error in
            guard let note = note
            else {
                completion(nil, CoreDataError.couldNotDeleteNote)
                return
            }
            
            completion(note, nil)
        }
    }
}

