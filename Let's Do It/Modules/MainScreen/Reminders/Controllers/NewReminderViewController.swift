//
//  NewReminderViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewReminderViewController

class NewReminderViewController: UIViewController {
    
    // MARK: Properties
    
    let headerArray = ["Title", "Date & Time", "Option"]
    private var remindersStore: RemindersStoreInput
    private var alertFactory: AlertFactory
    
    var reminder: Reminder?
    var colorTagCell: NewReminderTableViewCell?
    
    let newReminderCell = NewReminderTableViewCell()
    let newReminderView = NewReminderView()
    
    // MARK: Initialization
    
    init(
        with store: RemindersStoreInput,
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
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        newReminderView.delegate = self
        configureTableView()
        setTitle()
        swipeForKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setColorTagCellReference()
    }
    
    override func loadView() {
        super.loadView()
        view = newReminderView
        view.backgroundColor = .systemBackground
    }
    
    // MARK: Methods
    
    @objc private func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    private func swipeForKeyboard() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    private func setColorTagCellReference() {
        let colorTagCellIndexPath = IndexPath(row: 0, section: 2)
        colorTagCell = newReminderView.tableView.cellForRow(at: colorTagCellIndexPath) as? NewReminderTableViewCell
    }
    
    private func setTitle() {
        if reminder?.title == nil {
            title = "New Reminder"
        } else {
            title = reminder?.title
        }
    }
    
    private func configureTableView() {
        newReminderView.tableView.delegate = self
        newReminderView.tableView.dataSource = self
        newReminderView.tableView.backgroundColor = .clear
        newReminderView.tableView.separatorStyle = .none
        newReminderView.tableView.bounces = false
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
    
    func configureCell(cell: NewReminderTableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = cell.cellNameArray[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = .label
        switch indexPath {
        case [0,0]:
            cell.tf.isHidden = false
            cell.tf.text = "Title"
            
        case [0,1]:
            cell.tf.isHidden = false
            cell.tf.text = "Body"
        default:
            break
        }
        
        cell.tf.delegate = self
        
        if indexPath == [2,0] {
            cell.backgroundViewCell.backgroundColor = .secondarySystemFill
        }

        guard let reminder = reminder
        else { return }

        switch indexPath {
        case [0,0]:
            cell.tf.text = reminder.title
        case [0,1]:
            cell.tf.text = reminder.body
        case [1,0]:
            cell.textLabel?.text = reminder.date
        case [1,1]:
            cell.textLabel?.text = reminder.time
        case [2,0]:
            break
//            backgroundViewCell.backgroundColor = UIColor(named: reminder.color ?? "")
        default:
            break
        }
    }
}

// MARK: - Table View DataSource

extension NewReminderViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NewReminderTableViewCell.identifier, for: indexPath) as! NewReminderTableViewCell
        configureCell(cell: cell, indexPath: indexPath)
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
    
// MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewReminderTableViewCell
        configureSelectRow(cell: cell, indexPath: indexPath)
    }
}

// MARK: - Color Picker

extension NewReminderViewController: UIColorPickerViewControllerDelegate {
    
    @available(iOS 14.0, *)
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        colorTagCell?.backgroundViewCell.backgroundColor = color
    }
    
    @available(iOS 14.0, *)
    func pushVC() -> (UIColorPickerViewController) {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        
        present(colorPickerVC, animated: true)
        return colorPickerVC
    }
}


//MARK: - saveButtonTapped

extension NewReminderViewController: NewReminderViewDelegate {
    
    func saveButtonTapped() {
        guard let cells = newReminderView.tableView.visibleCells as? [NewReminderTableViewCell],
              let reminderTitle = cells.first?.tf.text,
              let reminderBody = cells[1].tf.text,
              let reminderDate = cells[2].textLabel?.text,
              let reminderTime = cells[3].textLabel?.text,
//              let reminderColor = cells[4].backgroundViewCell.backgroundColor,
              let context = UIApplication.shared.managedContext
        else {
            
            /// Тут перед return следовало бы показать alert
            return
        }
        
        let reminder = Reminder(context: context)
        reminder.title = reminderTitle
        reminder.body = reminderBody
        reminder.date = reminderDate
        reminder.time = reminderTime
        
        remindersStore.create(reminder: reminder) { reminder, error in
            if reminder != nil {
                self.dismiss(animated: true)
            }
        }
    }
}


extension NewReminderViewController: UITextFieldDelegate {
    
}

extension NewReminderViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
}
