//
//  NotesMainViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class NotesMainViewController: UIViewController {
    
    
    // MARK: Properties
    let notesView = NotesMainView()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        
        configureTableView()
        addTargetToButtons()
    }
    override func loadView() {
        super.loadView()
        view = notesView
        view.backgroundColor = .systemBackground
    }
    
    // MARK: Methods
    
    func configureTableView() {
        notesView.tableView.delegate = self
        notesView.tableView.dataSource = self
        notesView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        notesView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    func addTargetToButtons() {
        notesView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        notesView.allNotesButton.addTarget(self, action: #selector(allNotesButtonTapped), for: .touchUpInside)
        notesView.repeatedNotesButton.addTarget(self, action: #selector(repeatedNotesButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func addButtonTapped() {
        remindersAlert()
    }
    
    @objc func allNotesButtonTapped() {
        let vc = AllNotesViewController(
            store: NotesStore(
                coreDataService: CoreDataService()
            ),
            alertFactory: AlertFactory()
        )
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func repeatedNotesButtonTapped() {
//        let vc = MissingRemindersViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = notesView.notesListsArray[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.font = .appleSDGothicNeo20()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NotesMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesView.notesListsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.selectionStyle = .none
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")!

        header.textLabel?.text = "Lists:"
        header.textLabel?.textColor = .label
        header.textLabel?.font = .appleSDGothicNeoDemiBold30()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        guard let cell = tableView.cellForRow(at: indexPath) as? RemindersTableViewCell else {return}
    //
    //    }
}

// MARK: - remindersAlert

extension NotesMainViewController {
    
    func remindersAlert() {
      
        let alert = UIAlertController(title: "New Event", message: nil, preferredStyle: .alert)

        let newListAlert = UIAlertAction(title: "New List", style: .default) { (action) in

            let tfAlert = alert.textFields?.first
            

            guard let text = tfAlert?.text else { return }
            self.notesView.nameListStr.text = text
            self.notesView.nameListStr.font = .appleSDGothicNeo20()

            self.notesView.notesListsArray.insert(self.notesView.nameListStr.text ?? "New", at: 0)
            self.notesView.tableView.reloadData()
        }

        alert.addTextField { (tfAlert) in
            tfAlert.placeholder = "New Event"
            tfAlert.translatesAutoresizingMaskIntoConstraints = false

            tfAlert.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        let newNoteAlert = UIAlertAction(title: "New Note", style: .default) { (action) in

            let tfAlert = alert.textFields?.first

            guard let text = tfAlert?.text else { return }
            self.notesView.newNotes.text = text
            self.notesView.newNotes.font = .appleSDGothicNeo20()

            // open NewNote

        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        
        [newListAlert, newNoteAlert, cancel].forEach { alert.addAction($0) }

        alert.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}

