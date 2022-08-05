//
//  FsCalendar + Settings.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import FSCalendar

extension CalendarViewController: FSCalendarDataSource, FSCalendarDelegate  {
    
    func configureCalendar() {
        calendarView.calendar.delegate = self
        calendarView.calendar.dataSource = self
        calendarView.backgroundColor = .systemGray4
        calendarView.calendar.scope = .week
        calendarView.calendar.firstWeekday = 2
        calendarView.calendar.appearance.headerTitleColor = .systemOrange
        calendarView.calendar.appearance.weekdayTextColor = .blue
        calendarView.calendar.appearance.titleWeekendColor = .red
        calendarView.calendar.appearance.todayColor = .blue
        calendarView.calendar.appearance.selectionColor =  .green
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarView.calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}
