//
//  CalendarViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import FSCalendar

//MARK: - CalendarViewController

class CalendarViewController: ContentViewController {
    
    // MARK: Properties
    
    let idCalendarCell = Constants.idCalendarCell
    let idCalendarHeaderCell = Constants.idCalendarHeaderCell
    let calendarView = CalendarView()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        
        configureView()
    }
    
    override func loadView() {
        super.loadView()
        view = calendarView
    }
}

// MARK: - @objc extentions

@objc extension CalendarViewController {
    
    private func addButtonTapped() {
//        alertNewEvent()
    }
    
    private func hideShowButtonTapped() {
        if calendarView.calendar.scope == .week {
            calendarView.calendar.setScope(.month, animated: true )
            calendarView.hideShowButton.setTitle(Constants.monthView, for: .normal)
        } else {
            calendarView.calendar.setScope(.week, animated: true )
            calendarView.hideShowButton.setTitle(Constants.weekView, for: .normal)
        }
    }
    
    private func handleSwipe(gesture: UISwipeGestureRecognizer) {
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
   
    
// MARK: - Private Methods

extension CalendarViewController {
    
    private func configureView() {
        configureTableView()
        configureCalendar()
        swipeAction()
        setActionForButton()
    }
    
    private func setActionForButton() {
        calendarView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        calendarView.hideShowButton.addTarget(self, action: #selector(hideShowButtonTapped), for: .touchUpInside)
    }
    
    private func configureTableView() {
        calendarView.tableView.delegate = self
        calendarView.tableView.dataSource = self
        calendarView.tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.identifier)
        calendarView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: idCalendarHeaderCell)
        calendarView.tableView.backgroundColor = .clearColor
    }
    
    private func swipeAction() {
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendarView.calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendarView.calendar.addGestureRecognizer(swipeDown)
    }
}

// MARK:  - UITableViewDelegate, UITableViewDataSource

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTableViewCell.identifier, for: indexPath) as! CalendarTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .heightForRowAtMainTableViews
    }
}


// MARK: - Constants

private struct Constants {
    
    static let idCalendarCell = "idCalendarCell"
    static let idCalendarHeaderCell = "idCalendarHeaderCell"
    static let monthView = "Month View"
    static let weekView = "Week View"
}

