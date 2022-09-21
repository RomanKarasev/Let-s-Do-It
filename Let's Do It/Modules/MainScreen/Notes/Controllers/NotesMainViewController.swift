//
//  NotesMainViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

//MARK: - NotesMainViewController

class NotesMainViewController: BaseMainViewController {
    
    
    // MARK: Properties
    let notesView = NotesMainView()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        
        configureTableView()
        addTargetToButtons(floatingButton: notesView.floatingButton,
                           leftButton: notesView.leftButton,
                           rightButton: notesView.rightButton)
        
        
    }
    override func loadView() {
        super.loadView()
        view = notesView
        view.backgroundColor = .appBackgroundColor
    }
    
    // MARK: Methods
    
    private func configureTableView() {
        notesView.tableView.delegate = self
        notesView.tableView.dataSource = self
    }

    @objc override func leftButtonTapped() {
        let vc = AllNotesViewController(
            store: NotesStore(
                coreDataService: CoreDataService()
            ),
            alertFactory: AlertFactory()
        )
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc override func rightButtonTabed() {
//        let vc = MissingRemindersViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension NotesMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesView.listsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        return configureCell(cell: cell, indexPath: indexPath, array: notesView.listsArray
        )
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .heightForRowsAndHeader
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")!
        return configureHeader(header: header)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .heightForRowsAndHeader
    }

    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        guard let cell = tableView.cellForRow(at: indexPath) as? RemindersTableViewCell else {return}
    //
    //    }
}

