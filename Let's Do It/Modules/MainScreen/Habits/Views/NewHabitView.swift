//
//  NewHabitView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewHabitView

class NewHabitView: BaseNewView {
    
    // MARK: Properties
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.register(NewHabitViewCell.self, forCellReuseIdentifier: NewHabitViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
