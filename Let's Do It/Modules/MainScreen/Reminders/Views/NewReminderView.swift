//
//  NewReminderView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewReminderView

class NewReminderView: BaseNewView {
    
    // MARK: Properties
    

    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.register(NewReminderTableViewCell.self, forCellReuseIdentifier: NewReminderTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
