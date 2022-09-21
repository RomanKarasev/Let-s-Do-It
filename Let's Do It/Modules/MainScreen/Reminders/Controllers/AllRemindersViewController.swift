//
//  AllRemindersViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

// MARK: - AllRemindersViewController


class AllRemindersViewController: BaseAllViewController {
    
    // MARK: Properties
    
    let allRemindersView = BaseAllView()
    
    private var remindersStore: RemindersStoreInput
    private var alertFactory: AlertFactory
    
    var reminders = [Reminder]()
    
    // MARK: Initialization
    
    init(
        store: RemindersStoreInput,
        alertFactory: AlertFactory
    ) {
        self.remindersStore = store
        self.alertFactory = alertFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Reminders"
        
        configureTableView()
    }
    
    override func loadView() {
        super.loadView()
        view = allRemindersView
        view.backgroundColor = .appBackgroundColor
    }
    
    
    // MARK: Methods
    
    @objc override func openNewController() {
        let vc = NewReminderViewController(with: RemindersStore(coreDataService: CoreDataService()), alertFactory: AlertFactory())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func reloadData(from reminders: [Reminder]?) {
        guard let reminders = reminders
        else {
            return
        }
        
        self.reminders = reminders
        allRemindersView.tableView.reloadData()
    }
    
    private func configureTableView() {
        allRemindersView.tableView.delegate = self
        allRemindersView.tableView.dataSource = self
        allRemindersView.tableView.register(AllRemindersTableViewCell.self, forCellReuseIdentifier: AllRemindersTableViewCell.identifier)
        
        fetchReminders { reminders in
            if let reminders = reminders {
                self.reminders = reminders
            }
            
            self.allRemindersView.tableView.reloadData()
        }
        
    }
    
    private func fetchReminders(_ completion: @escaping ([Reminder]?) -> Void) {
        remindersStore.getReminders { reminders, error in
            if let reminders = reminders {
                completion(reminders)
            }
        }
    }
    
    func setSwipe(indexPath: IndexPath, tableView: UITableView) -> UISwipeActionsConfiguration {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete") { (action, view, completionHandler) in
                self.remindersStore.delete(
                    note: self.reminders[indexPath.row]
                ) { reminder, error in
                    guard let _ = reminder
                    else {
                        if let error = error {
                            self.present(
                                self.alertFactory.makeAlert(with: error),
                                animated: true
                            )
                        }
                        return
                    }
                    self.reminders.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                completionHandler(true)
            }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension AllRemindersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllRemindersTableViewCell.identifier,
                                                 for: indexPath) as! AllRemindersTableViewCell
        configureCell(cell: cell,
                      indexPath: indexPath,
                      array: reminders,
                      index: cell.index ?? indexPath,
                      title: cell.reminderTitle,
                      body: cell.reminderBody,
                      date: cell.reminderDate,
                      time: cell.reminderTime)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .heightForRowAtMainTableViews
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentReminder = reminders[indexPath.row]
        let viewController = NewReminderViewController(with: remindersStore, alertFactory: alertFactory)
        viewController.currentReminder = currentReminder
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        setSwipe(indexPath: indexPath, tableView: tableView)
        
        //    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //        let doneAction = UIContextualAction(
        //            style: .normal,
        //            title: "Done") { (action, view, completionHandler) in
        //                self.reminders[indexPath.row].status = "True"
        //                print(self.reminders[indexPath.row])
        //        }
        //        return UISwipeActionsConfiguration(actions: [doneAction])
        //    }
        
    }
}

// MARK: - <UINavigationDelegate> Comformance

extension AllRemindersViewController: UINavigationControllerDelegate {
    
    func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let viewController = viewController as? AllRemindersViewController
        else {
            return
        }
        
        viewController.fetchReminders { reminders in
            self.reloadData(from: reminders)
        }
    }
}





