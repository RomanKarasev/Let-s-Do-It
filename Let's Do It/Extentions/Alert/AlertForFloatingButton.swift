//
//  AlertForFloatingButton.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 21.09.2022.
//

import Foundation


// MARK: - remindersAlert

//extension NotesMainViewController {
//
//    func remindersAlert() {
//
//        let alert = UIAlertController(title: "New Event", message: nil, preferredStyle: .alert)
//
//        let newListAlert = UIAlertAction(title: "New List", style: .default) { (action) in
//
//            let tfAlert = alert.textFields?.first
//
//
//            guard let text = tfAlert?.text else { return }
//            self.notesView.nameListStr.text = text
//            self.notesView.nameListStr.font = .appleSDGothicNeo20()
//
//            self.notesView.notesListsArray.insert(self.notesView.nameListStr.text ?? "New", at: 0)
//            self.notesView.tableView.reloadData()
//        }
//
//        alert.addTextField { (tfAlert) in
//            tfAlert.placeholder = "New Event"
//            tfAlert.translatesAutoresizingMaskIntoConstraints = false
//
//            tfAlert.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        }
//        let newNoteAlert = UIAlertAction(title: "New Note", style: .default) { (action) in
//
//            let tfAlert = alert.textFields?.first
//
//            guard let text = tfAlert?.text else { return }
//            self.notesView.newNotes.text = text
//            self.notesView.newNotes.font = .appleSDGothicNeo20()
//
//            // open NewNote
//
//        }
//
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//
//
//        [newListAlert, newNoteAlert, cancel].forEach { alert.addAction($0) }
//
//        alert.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
//
//        present(alert, animated: true, completion: nil)
//    }
//}
//


// MARK: - remindersAlert

//extension RemindersMainViewController {
//
//    func remindersAlert() {
//
//        let alert = UIAlertController(title: "New Event", message: nil, preferredStyle: .alert)
//
//        let newListAlert = UIAlertAction(title: "New List", style: .default) { (action) in
//
//            let tfAlert = alert.textFields?.first
//
//
//            guard let text = tfAlert?.text else { return }
//            self.reminderView.nameListStr.text = text
//            self.reminderView.nameListStr.font = .appleSDGothicNeo20()
//
//            self.reminderView.remindersListsArray.insert(self.reminderView.nameListStr.text ?? "New", at: 0)
//            self.reminderView.tableView.reloadData()
//        }
//
//        alert.addTextField { (tfAlert) in
//            tfAlert.placeholder = "New Event"
//            tfAlert.translatesAutoresizingMaskIntoConstraints = false
//
//            tfAlert.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        }
//        let newReminerAlert = UIAlertAction(title: "New Reminder", style: .default) { (action) in
//
//            let tfAlert = alert.textFields?.first
//
//            guard let text = tfAlert?.text else { return }
//            self.reminderView.newReminder.text = text
//            self.reminderView.newReminder.font = .appleSDGothicNeo20()
//
//            // open NewReminder
//
//        }
//
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//
//
//        [newListAlert, newReminerAlert, cancel].forEach { alert.addAction($0) }
//
//        alert.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
//
//        present(alert, animated: true, completion: nil)
//    }
//}
