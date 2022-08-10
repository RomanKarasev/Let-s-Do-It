//
//  HabitsMainViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class HabitsMainViewController: UIViewController {


    // MARK: Properties
    let habitView = HabitsMainView()
    
//    private var dataManager: RemindersListDataManager?
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Habits"
        
        configureTableView()
        habitView.setConstraints()
        addTargetToButtons()
    }
    override func loadView() {
        super.loadView()
        view = habitView
        view.backgroundColor = .systemGray4
    }
    
    // MARK: Methods
    
    func configureTableView() {
        habitView.tableView.delegate = self
        habitView.tableView.dataSource = self
        habitView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        habitView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    func addTargetToButtons() {
        habitView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        habitView.allHabitsButton.addTarget(self, action: #selector(allHabitsFolderButtonTapped), for: .touchUpInside)
        habitView.tasksHabitButton.addTarget(self, action: #selector(tasksHabitsButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func addButtonTapped() {
        habitsAlert()
    }
    
    @objc func allHabitsFolderButtonTapped() {
        let vc = AllHabitsViewController(
            store: HabitsStore(
                coreDataService: CoreDataService()
            ),
            alertFactory: AlertFactory()
        )
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tasksHabitsButtonTapped() {
//        let vc = MissingRemindersViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = habitView.habitsListsArray[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.font = .appleSDGothicNeo20()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HabitsMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitView.habitsListsArray.count
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

extension HabitsMainViewController {
    
    func habitsAlert() {
      
        let alert = UIAlertController(title: "New Event", message: nil, preferredStyle: .alert)

        let newListAlert = UIAlertAction(title: "New List", style: .default) { (action) in

            let tfAlert = alert.textFields?.first
            

            guard let text = tfAlert?.text else { return }
            self.habitView.nameListStr.text = text
            self.habitView.nameListStr.font = .appleSDGothicNeo20()

            self.habitView.habitsListsArray.insert(self.habitView.nameListStr.text ?? "New", at: 0)
            self.habitView.tableView.reloadData()
        }

        alert.addTextField { (tfAlert) in
            tfAlert.placeholder = "New Event"
            tfAlert.translatesAutoresizingMaskIntoConstraints = false

            tfAlert.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        let newHabitAlert = UIAlertAction(title: "New Habit", style: .default) { (action) in

            let tfAlert = alert.textFields?.first

            guard let text = tfAlert?.text else { return }
            self.habitView.newHabit.text = text
            self.habitView.newHabit.font = .appleSDGothicNeo20()

            // open NewReminder

        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        
        [newListAlert, newHabitAlert, cancel].forEach { alert.addAction($0) }

        alert.view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}

