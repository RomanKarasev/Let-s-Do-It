//
//  RemindersMainViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//


import UIKit

//MARK: - RemindersMainViewController

class RemindersMainViewController: BaseMainViewController {
    
    
    // MARK: Properties
    
    let reminderView = RemindersMainView()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reminders"
        
        configureTableView()
        addTargetToButtons(floatingButton: reminderView.floatingButton,
                           leftButton: reminderView.leftButton,
                           rightButton: reminderView.rightButton)
    }
    override func loadView() {
        super.loadView()
        view = reminderView
        view.backgroundColor = .appBackgroundColor
    }
    
    // MARK: Methods
    
    private func configureTableView() {
        reminderView.tableView.delegate = self
        reminderView.tableView.dataSource = self
    }
    
    @objc override func leftButtonTapped() {
        let vc = AllRemindersViewController(
            store: RemindersStore(
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

extension RemindersMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderView.listsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        return configureCell(cell: cell, indexPath: indexPath, array: reminderView.listsArray)
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

