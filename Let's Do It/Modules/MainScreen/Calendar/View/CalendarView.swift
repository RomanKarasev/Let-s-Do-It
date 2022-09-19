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
        tableView.backgroundColor = .clearColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // Buttons
    
    lazy var floatingButton = UIButton.setupFloatingButton()
    
    let hideShowButton : UIButton = {
        let button = UIButton()
        button.setTitle("Month View", for: .normal)
        button.setTitleColor(UIColor.accentColor, for: .normal)
        button.titleLabel?.font = UIFont.appleSDGothicNeo14()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .appBackgroundColor
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Private Methods
    
extension CalendarView {
    
    private func setConstraints() {
        
        self.addSubview(calendar)
        calendarHeightConstraint = NSLayoutConstraint(
            item: calendar,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: Constants.calendarHeightConstraintConstant
        )
        calendar.addConstraint(calendarHeightConstraint)
        
        
        NSLayoutConstraint.activate(
            [calendar.topAnchor.constraint(equalTo: self.topAnchor,
                                           constant: Constants.calendarTopAnchor),
             calendar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             calendar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ]
        )
        
        self.addSubview(hideShowButton)
        NSLayoutConstraint.activate(
            [hideShowButton.topAnchor.constraint(equalTo: calendar.bottomAnchor),
             hideShowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             hideShowButton.heightAnchor.constraint(equalToConstant: Constants.hideShowButtonHeightAnchor),
             hideShowButton.widthAnchor.constraint(equalToConstant: Constants.hideShowButtonWidthAnchor)
            ]
        )
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: hideShowButton.bottomAnchor,
                                            constant: Constants.tableViewTopAnchor),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                               constant: Constants.tableViewBottomAnchor)
            ]
        )
        
        UIButton.setFloatingButtonConstraints(view: self, floatingButton: floatingButton)
    }
}

// MARK: - Constants

private struct Constants {
    
    static let calendarHeightConstraintConstant: CGFloat = 300
    static let calendarTopAnchor: CGFloat = 90
    static let hideShowButtonHeightAnchor: CGFloat = 20
    static let hideShowButtonWidthAnchor: CGFloat = 100
    static let tableViewTopAnchor: CGFloat = 10
    static let tableViewBottomAnchor: CGFloat = -50
}

