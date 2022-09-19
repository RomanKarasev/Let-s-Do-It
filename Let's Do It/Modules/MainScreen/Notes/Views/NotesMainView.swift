//
//  NotesMainView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

class NotesMainView: UIView {
    
    // MARK: Properties
    
    var notesListsArray = ["Inbox", "Quick Notes"]
    
    let allNotesButton = NotesMainButtons().allNotesButton
    let repeatedNotesButton = NotesMainButtons().repeatedNotesButton
    
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
    
    var newNotes: UILabel = {
        let label = UILabel()
        label.text = "New"
        return label
    }()
    
    lazy var floatingButton = UIButton.setupFloatingButton()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        
        self.addSubview(allNotesButton)
        NSLayoutConstraint.activate(
            [allNotesButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
             allNotesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
             allNotesButton.heightAnchor.constraint(equalToConstant: 80),
             allNotesButton.widthAnchor.constraint(equalToConstant: 150)
            ]
        )
        
        self.addSubview(repeatedNotesButton)
        NSLayoutConstraint.activate(
            [repeatedNotesButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
             repeatedNotesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
             repeatedNotesButton.heightAnchor.constraint(equalToConstant: 80),
             repeatedNotesButton.widthAnchor.constraint(equalToConstant: 150)
            ]
        )
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: allNotesButton.bottomAnchor, constant: 50),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
             tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ]
        )
        
        UIButton.setFloatingButtonConstraints(view: self, floatingButton: floatingButton)
    }
}

