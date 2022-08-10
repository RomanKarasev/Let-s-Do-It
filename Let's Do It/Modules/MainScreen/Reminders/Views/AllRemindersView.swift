//
//  AllRemindersView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

// MARK: - AllRemindersView

class AllRemindersView: UIView {
    
    // MARK: Properties
    
   
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
                                    ])
    }
}

