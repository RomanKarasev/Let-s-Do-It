//
//  NewNoteViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewNoteViewController

class NewNoteViewController: UIViewController {
    
    // MARK: Properties
    
    let headerArray = ["Title", "Date & Time", "Option"]
    private var notesStore: NotesStoreInput
    private var alertFactory: AlertFactory
    
    var note: Note?
    
    var newNoteCell = NewNoteViewCell()
    let newNoteView = NewNoteView()
    
    // MARK: Initialization
    
    init(
        with store: NotesStoreInput,
        alertFactory: AlertFactory
    ) {
        self.notesStore = store
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
        title = "New Note"
        
        view = newNoteView
        view.backgroundColor = .systemBackground
        newNoteView.delegate = self
        configureTableView()
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setColorTagCellReference()
    }
    
    // MARK: Methods
    
    func setColorTagCellReference() {
        let colorTagCellIndexPath = IndexPath(row: 0, section: 2)
        newNoteCell = newNoteView.tableView.cellForRow(at: colorTagCellIndexPath) as! NewNoteViewCell
    }
    
    func configureTableView() {
        newNoteView.tableView.delegate = self
        newNoteView.tableView.dataSource = self
        newNoteView.tableView.backgroundColor = .clear
        newNoteView.tableView.separatorStyle = .none
        newNoteView.tableView.bounces = false
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
extension NewNoteViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: NewNoteViewCell.identifier, for: indexPath) as! NewNoteViewCell
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
        let cell = tableView.cellForRow(at: indexPath) as! NewNoteViewCell
        configureSelectRow(cell: cell, indexPath: indexPath)
    }
}
// MARK: - Color Picker

extension NewNoteViewController: UIColorPickerViewControllerDelegate {
    
    @available(iOS 14.0, *)
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        newNoteCell.backgroundViewCell.backgroundColor = color
    }
    
    @available(iOS 14.0, *)
    func pushVC() -> (UIColorPickerViewController) {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        
        present(colorPickerVC, animated: true)
        return colorPickerVC
    }
}

extension NewNoteViewController: NewNoteViewDelegate {
    
    func saveButtonTapped() {
        guard let cells = newNoteView.tableView.visibleCells as? [NewNoteViewCell],
              let noteTitle = cells.first?.cellTextField.text,
              let noteBody = cells[1].cellTextField.text,
              let noteDate = cells[2].textLabel?.text,
              let noteTime = cells[3].textLabel?.text,
              let context = UIApplication.shared.managedContext
        else {
            
            /// Тут перед return следовало бы показать alert
            return
        }
        
        let note = Note(context: context)
        note.title = noteTitle
        note.body = noteBody
        note.date = noteDate
        note.time = noteTime
        
        notesStore.create(note: note) { note, error in
            if let note = note {
                self.dismiss(animated: true)
            }
        }
    }
}

extension NewNoteViewController: UITextFieldDelegate {
    
}
