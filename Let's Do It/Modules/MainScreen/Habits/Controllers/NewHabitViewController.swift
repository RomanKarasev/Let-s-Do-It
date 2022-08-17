//
//  NewHabitViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

// MARK: - NewHabitViewController

class NewHabitViewController: UIViewController {
    
    // MARK: Properties
    
    let headerArray = ["Title", "Date & Time", "Option"]
    private var habitsStore: HabitsStoreInput
    private var alertFactory: AlertFactory
    
    var habit: Habit?

    
    var newHabitCell = NewHabitViewCell()
    let newHabitView = NewHabitView()
    
    // MARK: Initialization
    
    init(
        with store: HabitsStoreInput,
        alertFactory: AlertFactory
    ) {
        self.habitsStore = store
        self.alertFactory = alertFactory
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Habit"
        
        view = newHabitView
        view.backgroundColor = .systemBackground
        newHabitView.delegate = self
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setColorTagCellReference()
    }
    
    // MARK: Methods
    
    func setColorTagCellReference() {
        let colorTagCellIndexPath = IndexPath(row: 0, section: 2)
        newHabitCell = newHabitView.tableView.cellForRow(at: colorTagCellIndexPath) as! NewHabitViewCell
    }
    
    func configureTableView() {
        newHabitView.tableView.delegate = self
        newHabitView.tableView.dataSource = self
        newHabitView.tableView.backgroundColor = .clear
        newHabitView.tableView.separatorStyle = .none
        newHabitView.tableView.bounces = false
    }
    
    func configureSelectRow(cell: UITableViewCell, indexPath: IndexPath) {
        guard let label: UILabel = cell.textLabel else { return }
        switch indexPath {
            
        case [1,0]: alertDate(label: label) { (numberWeekday, date) in
            print(numberWeekday, date)
        }
        case [1,1]: alertTime(label: label) { (time) in
            print(time)
        }
            
        case [2,0]: if #available(iOS 14.0, *) {
            let vc = pushVC()
            colorPickerViewControllerDidFinish(vc)
        } else { }
            
        default: print("Tap OptionReminderTableView")
        }
        
    }
    
    func showModal() {
        //        let modalViewController = TagViewController()
        //        modalViewController.modalPresentationStyle = .formSheet
        //        present(modalViewController, animated: true, completion: nil)
    }
}

// MARK: Table View DataSource
extension NewHabitViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 2
        case 2: return 1
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewHabitViewCell.identifier, for: indexPath) as! NewHabitViewCell
        cell.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
            return headerArray[section]
        }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // MARK: Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewHabitViewCell
        configureSelectRow(cell: cell, indexPath: indexPath)
    }
}
// MARK: - Color Picker

extension NewHabitViewController: UIColorPickerViewControllerDelegate {
    
    @available(iOS 14.0, *)
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        newHabitCell.backgroundViewCell.backgroundColor = color
    }
    
    @available(iOS 14.0, *)
    func pushVC() -> (UIColorPickerViewController) {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        
        present(colorPickerVC, animated: true)
        return colorPickerVC
    }
}

extension NewHabitViewController: NewHabitViewDelegate {
    
    func saveButtonTapped() {
        guard let cells = newHabitView.tableView.visibleCells as? [NewHabitViewCell],
              let habitTitle = cells.first?.tf.text,
              let habitBody = cells[1].tf.text,
//              let habitDate = cells[2].textLabel?.text,
//              let habitTime = cells[3].textLabel?.text,
//              let reminderColor = cells[4].backgroundViewCell.backgroundColor,
              let context = UIApplication.shared.managedContext
        else {
            
            /// Тут перед return следовало бы показать alert
            return
        }
        
        let habit = Habit(context: context)
        habit.title = habitTitle
        habit.body = habitBody
//        habit.date = habitDate
//        habit.dayCount = habitTime
        
        habitsStore.create(habit: habit) { habit, error in
            if let habit = habit {
                self.dismiss(animated: true)
            }
        }
    }
}

extension NewHabitViewController: UITextFieldDelegate {
    
}
