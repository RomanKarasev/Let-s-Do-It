//
//  BaseNewView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 19.09.2022.
//

import UIKit

//MARK: - NewViewDelegate

protocol NewViewDelegate: AnyObject {
    
    func saveButtonTapped()
}

// MARK: - BaseNewView

class BaseNewView: UIView {
    
    // MARK: Properties
    
    weak var delegate: NewViewDelegate?
    
    lazy var createButton = UIButton.doCreateButton()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clearColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
    }
    
    // MARK: Methods
    
    @objc func saveAction() {
        delegate?.saveButtonTapped()
    }
    
    func setConstraints() {
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.tableViewBottomAnchor)
            ]
        )
        
        self.addSubview(createButton)
        NSLayoutConstraint.activate(
            [createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             createButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.createButtonBottomAnchor),
             createButton.widthAnchor.constraint(equalToConstant: Constants.createButtonWidthAnchor),
             createButton.heightAnchor.constraint(equalToConstant: Constants.createButtonHeightAnchor)
            ]
        )
    }
}

// MARK: - Constants

private struct Constants {
    
    static let tableViewBottomAnchor: CGFloat = -200
    static let createButtonBottomAnchor: CGFloat = -UIScreen.main.bounds.height / 8
    static let createButtonWidthAnchor: CGFloat = 327
    static let createButtonHeightAnchor: CGFloat = 56

    
}

