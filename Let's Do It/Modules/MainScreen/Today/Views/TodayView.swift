//
//  TodayView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - TodayView

class TodayView: UIView {
    
    // MARK: Properties
   
    // UiViews
    
    var headerView = TableHeaderView(frame: CGRect(x: 0, y: 90, width: UIScreen.main.bounds.size.width, height: 150))

    var heightOfHeader: CGFloat = 150
    
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


 
    // Buttons
    lazy var floatingButton = UIButton.setupFloatingButton()
   
    func setConstraints() {
        
        self.addSubview(headerView)
        NSLayoutConstraint.activate([headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
                                     headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     headerView.heightAnchor.constraint(equalToConstant: 150)
                                    ])
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5),
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



