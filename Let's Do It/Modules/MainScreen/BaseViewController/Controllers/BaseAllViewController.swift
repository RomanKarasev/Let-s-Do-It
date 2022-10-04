//
//  BaseAllViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 21.09.2022.
//

import UIKit
import FSCalendar

// MARK: - BaseAllViewController


class BaseAllViewController: UIViewController {
    
    let baseAllView = BaseAllView()
   
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Notes"
        
//        baseAllView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .add,
            style: .plain,
            target: self,
            action: #selector(openNewController)
        )
    }
    
    // MARK: Methods
    
    @objc func openNewController() {
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath, array: [AnyObject], index: IndexPath, title: UILabel, body: UILabel, date: UILabel, time: UILabel) {
        
        _ = indexPath
        let indexOfArray = array[indexPath.row]
        title.text = indexOfArray.title
        body.text = indexOfArray.body
        date.text = indexOfArray.date
        time.text = indexOfArray.time
    }
    
    func configureCalendar(calendar: FSCalendar) {
        
        calendar.scope = .week
        calendar.firstWeekday = 2
        calendar.appearance.headerTitleColor = .systemRed
        calendar.appearance.weekdayTextColor = .blue
        calendar.appearance.titleWeekendColor = .red
        calendar.appearance.todayColor = .accentColor
        calendar.appearance.selectionColor =  .mainColor
        calendar.appearance.titleDefaultColor = .label
    }
}

// MARK: - Constants

private struct Constants {

    static let idCalendarCell = "idCalendarCell"
    static let idCalendarHeaderCell = "idCalendarHeaderCell"
    static let monthView = "Month View"
    static let weekView = "Week View"
}



