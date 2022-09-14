//
//  NewNoteView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//

import UIKit

//MARK: - NewNoteViewDelegate

protocol NewNoteViewDelegate: AnyObject {

    func saveButtonTapped()
}

// MARK: - NewNoteView

class NewNoteView: UIView {
    
    // MARK: Properties
    
    weak var delegate: NewNoteViewDelegate?
    
    lazy var createButton = UIButton.doCreateButton()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.register(NewNoteViewCell.self, forCellReuseIdentifier: NewNoteViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
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

    @objc private func saveAction() {
        delegate?.saveButtonTapped()
    }
    
    private func setConstraints() {
        
        self.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200)
                                    ]
        )
        
        self.addSubview(createButton)
        NSLayoutConstraint.activate(
            [createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     createButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
                                     createButton.widthAnchor.constraint(equalToConstant: 327),
                                     createButton.heightAnchor.constraint(equalToConstant: 56)
                                    ]
        )
    }
}
