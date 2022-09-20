//
//  BaseMainView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 20.09.2022.
//

import UIKit

class BaseMainView: UIView {
    
    // MARK: Properties
    static let shared = BaseMainView()
    var listsArray = [String]()
    
    let nameLeftFolderLabel = UILabel(text: "", font: .appleSDGothicNeo14(), alignment: .center)
    
    let countLeftFolderLabel: UILabel = {
        var count = 20
        let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
        label.contentMode = .bottom
        label.textColor = .label
        return label
    }()
    
    let nameRightFolderLabel: UILabel = {
        let label = UILabel(text: "", font: .appleSDGothicNeo14(), alignment: .center)
        label.textColor = .red
        return label
    }()
    
    let countRightFolderLabel: UILabel = {
        var count = 5
        let label = UILabel(text: "\(count)", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
        label.textColor = .red
        label.contentMode = .bottom
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.addSubview(nameLeftFolderLabel)
        NSLayoutConstraint.activate(
            [nameLeftFolderLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
             nameLeftFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
             nameLeftFolderLabel.heightAnchor.constraint(equalToConstant: 15),
             nameLeftFolderLabel.widthAnchor.constraint(equalTo: button.widthAnchor)
            ]
        )
        button.addSubview(countLeftFolderLabel)
        NSLayoutConstraint.activate(
            [countLeftFolderLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -2),
             countLeftFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
             countLeftFolderLabel.heightAnchor.constraint(equalToConstant: 50),
             countLeftFolderLabel.widthAnchor.constraint(equalToConstant: 70)
            ]
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = .init(width: 2, height: 2)
        return button
    }()
    //
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.addSubview(nameRightFolderLabel)
        NSLayoutConstraint.activate(
            [nameRightFolderLabel.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
             nameRightFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
             nameRightFolderLabel.heightAnchor.constraint(equalToConstant: 15),
             nameRightFolderLabel.widthAnchor.constraint(equalTo: button.widthAnchor)
            ]
        )
        button.addSubview(countRightFolderLabel)
        NSLayoutConstraint.activate(
            [countRightFolderLabel.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -2),
             countRightFolderLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
             countRightFolderLabel.heightAnchor.constraint(equalToConstant: 50),
             countRightFolderLabel.widthAnchor.constraint(equalToConstant: 70)
            ]
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = .init(width: 2, height: 2)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clearColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    var nameListStr: UILabel = {
//        let label = UILabel()
//        label.text = "New"
//        return label
//    }()
//
//    var newReminder: UILabel = {
//        let label = UILabel()
//        label.text = "New"
//        return label
//    }()
//
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
        
        self.addSubview(leftButton)
        NSLayoutConstraint.activate(
            [leftButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
             leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
             leftButton.heightAnchor.constraint(equalToConstant: 80),
             leftButton.widthAnchor.constraint(equalToConstant: 150)
            ]
        )
        
        self.addSubview(rightButton)
        NSLayoutConstraint.activate(
            [rightButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
             rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
             rightButton.heightAnchor.constraint(equalToConstant: 80),
             rightButton.widthAnchor.constraint(equalToConstant: 150)
            ]
        )
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: leftButton.bottomAnchor, constant: 50),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
             tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ]
        )
        
        UIButton.setFloatingButtonConstraints(view: self, floatingButton: floatingButton)
    }
}

