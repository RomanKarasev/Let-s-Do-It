//
//  CalendarView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
import FSCalendar

// MARK: - CalendarView

class CalendarView: UIView {
    
    // MARK: Properties
    

    var calendarHeightConstraint: NSLayoutConstraint!
    var topBackgroundHeightConstraint: NSLayoutConstraint!

    // Views

    var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()

    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Buttons

    lazy var floatingButton = UIButton.setupFloatingButton()

    let hideShowButton : UIButton = {
        let button = UIButton()
        button.setTitle("Month View", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont.appleSDGothicNeo14()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setConstraints() {

       
        self.addSubview(calendar)
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraint)


        NSLayoutConstraint.activate([calendar.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
                                     calendar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     calendar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
                                    ])

        self.addSubview(hideShowButton)
        NSLayoutConstraint.activate([hideShowButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
                                     hideShowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     hideShowButton.heightAnchor.constraint(equalToConstant: 20),
                                     hideShowButton.widthAnchor.constraint(equalToConstant: 100)
                                    ])

        self.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: hideShowButton.bottomAnchor, constant: 10),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
                                    ])


        self.addSubview(floatingButton)
        NSLayoutConstraint.activate([floatingButton.widthAnchor.constraint(equalToConstant: 60),
                                     floatingButton.heightAnchor.constraint(equalToConstant: 60),
                                     floatingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
                                     floatingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110)
                                    ])
    }
}
