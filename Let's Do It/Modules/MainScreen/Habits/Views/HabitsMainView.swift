//
//  HabitsMainView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//


import UIKit

//// MARK: - HabitsMainView
//
//protocol PopoverDelegate: AnyObject {
//    func addedNewList()
//}


class HabitsMainView: UIView {
    
    // MARK: Properties
    
    var habitsListsArray = ["Health", "Quit the habit"]

    let allHabitsButton = HabitsMainButtons().allHabitsButton
    let tasksHabitButton = HabitsMainButtons().tasksHabitsButton
    
//    weak var delegate: PopoverDelegate?
    // UIViews
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var nameListStr: UILabel = {
        let label = UILabel()
        label.text = "New"
        return label
    }()
    
    var newHabit: UILabel = {
        let label = UILabel()
        label.text = "New"
        return label
    }()
    
    lazy var floatingButton = UIButton.setupFloatingButton()
    
    
    func setConstraints() {
        
        self.addSubview(allHabitsButton)
        NSLayoutConstraint.activate([allHabitsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                     allHabitsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                                     allHabitsButton.heightAnchor.constraint(equalToConstant: 80),
                                     allHabitsButton.widthAnchor.constraint(equalToConstant: 150)
                                    ])
        
        self.addSubview(tasksHabitButton)
        NSLayoutConstraint.activate([tasksHabitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                     tasksHabitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     tasksHabitButton.heightAnchor.constraint(equalToConstant: 80),
                                     tasksHabitButton.widthAnchor.constraint(equalToConstant: 150)
                                    ])
       
        self.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: allHabitsButton.bottomAnchor, constant: 50),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
                                    ])
        
        self.addSubview(floatingButton)
        NSLayoutConstraint.activate([floatingButton.widthAnchor.constraint(equalToConstant: 60),
                                     floatingButton.heightAnchor.constraint(equalToConstant: 60),
                                     floatingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
                                     floatingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110)
                                    ])
    }
}


