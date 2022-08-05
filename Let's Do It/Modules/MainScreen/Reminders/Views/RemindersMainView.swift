//
//  RemindersMainView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class RemindersMainView: UIView {
    
    // MARK: Properties
    
    var remindersListsArray = ["Inbox", "Repeated Reminders"]

    let allRemindersButton = RemindersMainButtons().allRemindersButton
    let missedRemindersButton = RemindersMainButtons().missedRemindersButton
    
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
    
    var newReminder: UILabel = {
        let label = UILabel()
        label.text = "New"
        return label
    }()
    
    lazy var floatingButton = UIButton.setupFloatingButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        self.addSubview(allRemindersButton)
        NSLayoutConstraint.activate([allRemindersButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                     allRemindersButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                                     allRemindersButton.heightAnchor.constraint(equalToConstant: 80),
                                     allRemindersButton.widthAnchor.constraint(equalToConstant: 150)
                                    ])
        
        self.addSubview(missedRemindersButton)
        NSLayoutConstraint.activate([missedRemindersButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                                     missedRemindersButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                                     missedRemindersButton.heightAnchor.constraint(equalToConstant: 80),
                                     missedRemindersButton.widthAnchor.constraint(equalToConstant: 150)
                                    ])
       
        self.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: allRemindersButton.bottomAnchor, constant: 50),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
                                    ])
        
        self.addSubview(floatingButton)
        NSLayoutConstraint.activate([floatingButton.widthAnchor.constraint(equalToConstant: 60),
                                     floatingButton.heightAnchor.constraint(equalToConstant: 60),
                                     floatingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
                                     floatingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
                                    ])
    }
}

