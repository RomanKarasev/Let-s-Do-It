//
//  AllNotesViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit
import FSCalendar

// MARK: - AllNotesViewController


class AllNotesViewController: BaseAllViewController {
    
    // MARK: Properties
    
    let allNotesView = BaseAllView()
    
    private var notesStore: NotesStoreInput
    private var alertFactory: AlertFactory
    
    var notes = [Note]()
    
    // MARK: - Initialization
    
    init(
        store: NotesStoreInput,
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
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Notes"
        
        setForNotesVC()
    }
    
    override func loadView() {
        super.loadView()
        view = allNotesView
        view.backgroundColor = .appBackgroundColor
    }
    
    // MARK: Methods
    
    
    @objc override func openNewController() {
        let vc = NewNoteViewController(with: NotesStore(coreDataService: CoreDataService()), alertFactory: AlertFactory())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureTableView() {
        allNotesView.tableView.delegate = self
        allNotesView.tableView.dataSource = self
        allNotesView.tableView.register(AllNotesViewCell.self, forCellReuseIdentifier: AllNotesViewCell.identifier)
        
        fetchNotes { notes in
            if let notes = notes {
                self.notes = notes
            }
            self.allNotesView.tableView.reloadData()
        }
    }
    
    func setForNotesVC() {
        allNotesView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        allNotesView.hideShowButton.addTarget(self, action: #selector(hideShowButtonTapped), for: .touchUpInside)
        configureTableView()
        swipeAction()
        configureNotesCalendar()
    }
    
   func configureNotesCalendar() {
        allNotesView.calendar.delegate = self
        allNotesView.calendar.dataSource = self
        configureCalendar(calendar: allNotesView.calendar)
    }
    
    private func fetchNotes(_ completion: @escaping ([Note]?) -> Void) {
        notesStore.getNotes { notes, error in
            if let notes = notes {
                completion(notes)
            }
        }
    }
   
    
    
    func swipeAction() {

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        allNotesView.calendar.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        allNotesView.calendar.addGestureRecognizer(swipeDown)
    }
    
    private func setSwipe(indexPath: IndexPath, tableView: UITableView) -> UISwipeActionsConfiguration {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete") { (action, view, completionHandler) in
                self.notesStore.delete(
                    note: self.notes[indexPath.row]
                ) { note, error in
                    guard let _ = note
                    else {
                        if let error = error {
                            self.present(
                                self.alertFactory.makeAlert(with: error),
                                animated: true
                            )
                        }
                        return
                    }
                    self.notes.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                completionHandler(true)
            }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

@objc extension AllNotesViewController {
    
    
    func hideShowButtonTapped() {
        if allNotesView.calendar.scope == .week {
            allNotesView.calendar.setScope(.month, animated: true )
            allNotesView.hideShowButton.setTitle(Constants.monthView, for: .normal)
        } else {
            allNotesView.calendar.setScope(.week, animated: true )
            allNotesView.hideShowButton.setTitle(Constants.weekView, for: .normal)
        }
    }
    
    func addButtonTapped() {
        
    }
    
    func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .up:
            hideShowButtonTapped()
        case .down:
            hideShowButtonTapped()
        default:
            break
        }
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension AllNotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllNotesViewCell.identifier, for: indexPath) as! AllNotesViewCell
        configureCell(cell: cell,
                      indexPath: indexPath,
                      array: notes,
                      index: cell.index ?? indexPath,
                      title: cell.noteTitle,
                      body: cell.noteBody,
                      date: cell.noteDate,
                      time: cell.noteTime)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .heightForRowAtMainTableViews
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentNote = notes[indexPath.row]
        let viewController = NewNoteViewController(with: notesStore, alertFactory: alertFactory)
        viewController.currentNote = currentNote
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        setSwipe(indexPath: indexPath, tableView: tableView)
    }
}


//MARK: - FSCalendarDataSource, FSCalendarDelegate

extension AllNotesViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        allNotesView.calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}

// MARK: - Constants

private struct Constants {
    
    static let idCalendarCell = "idCalendarCell"
    static let idCalendarHeaderCell = "idCalendarHeaderCell"
    static let monthView = "Month View"
    static let weekView = "Week View"
}
