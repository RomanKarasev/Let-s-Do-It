//
//  RemindersMainViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//


import UIKit

//MARK: - RemindersMainViewController

class RemindersMainViewController: UIViewController {


    // MARK: Properties

    let reminderView = RemindersMainView()

//    private var dataManager: RemindersListDataManager?


    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reminders"
        
        navigationItem.largeTitleDisplayMode = .never
        
        configureTableView()
        addTargetToButtons()
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
        reminderView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        reminderView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
    }

    private func addTargetToButtons() {
        reminderView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        reminderView.leftButton.addTarget(self, action: #selector(allRemindersFolderButtonTapped), for: .touchUpInside)
        reminderView.rightButton.addTarget(self, action: #selector(missedRemindersFolderButtonTapped), for: .touchUpInside)
    }


    @objc private func addButtonTapped() {
//        remindersAlert()
    }

    @objc private func allRemindersFolderButtonTapped() {
        let vc = AllRemindersViewController(
            store: RemindersStore(
                coreDataService: CoreDataService()
            ),
            alertFactory: AlertFactory()
        )
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func missedRemindersFolderButtonTapped() {
//        let vc = MissingRemindersViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }

    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = reminderView.listsArray[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.font = .appleSDGothicNeo20()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension RemindersMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderView.listsArray.count
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
