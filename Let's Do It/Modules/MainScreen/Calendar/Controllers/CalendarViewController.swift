//
//  CalendarViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import FSCalendar

class CalendarViewController: ContentViewController {
    
    
    // MARK: Properties
    
    let idCalendarCell = "idCalendarCell"
    let idCalendarHeaderCell = "idCalendarHeaderCell"
    let calendarView = CalendarView()
//    let header = CalendarHeaderTableViewCell()
    
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
    
    func configureView() {
        configureTableView()
        configureCalendar()
        swipeAction()
        setActionForButton()
    }
    
    func setActionForButton() {
        calendarView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        calendarView.hideShowButton.addTarget(self, action: #selector(hideShowButtonTapped), for: .touchUpInside)
    }
    
    // MARK: Methods
    
    @objc func addButtonTapped() {
//        alertNewEvent()
    }
    
    @objc func hideShowButtonTapped() {
        if calendarView.calendar.scope == .week {
            calendarView.calendar.setScope(.month, animated: true )
            calendarView.hideShowButton.setTitle("Month View", for: .normal)
        } else {
            calendarView.calendar.setScope(.week, animated: true )
            calendarView.hideShowButton.setTitle("Week View", for: .normal)
        }
    }
    
    
    func configureTableView() {
        calendarView.tableView.delegate = self
        calendarView.tableView.dataSource = self
        calendarView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCalendarCell)
        calendarView.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: idCalendarHeaderCell)
        calendarView.tableView.backgroundColor = .clear
    }
    
    func swipeAction() {
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendarView.calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendarView.calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
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

// MARK:  - UITableViewDelegate, UITableViewDataSource

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return header.headerArray.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCalendarCell, for: indexPath)
//        cell.index = indexPath
        cell.backgroundColor = .clear
        cell.textLabel?.text = "fff"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idCalendarHeaderCell)
//        header.headerConfigure(section: section)
        header?.textLabel?.text = "Header"
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}


