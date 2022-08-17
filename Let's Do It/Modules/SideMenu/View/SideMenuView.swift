//
//  SideMenuView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - SideMenuView

class SideMenuView: UIView {
    
    var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var sideMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    // Labels
    
    var hiLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi, User"
        label.font = .appleSDGothicNeoDemiBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var phraseLabel: UILabel = {
        let label = UILabel()
        let textPhrase = Arrays()
        label.text = textPhrase.getPhrase()
        label.font = .appleSDGothicNeo12()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //
    // Buttons
    
    lazy var authButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Init
    
    
    init() {
        super.init(frame: .zero)
        
        configureConstraints()
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureConstraints() {
        
        self.addSubview(sideMenuView)
        NSLayoutConstraint.activate([sideMenuView.topAnchor.constraint(equalTo: self.topAnchor),
                                     sideMenuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     sideMenuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     sideMenuView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                                    ])
        
        
        sideMenuView.addSubview(headerView)
        NSLayoutConstraint.activate([headerView.topAnchor.constraint(equalTo: sideMenuView.topAnchor),
                                     headerView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
                                     headerView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
                                     headerView.heightAnchor.constraint(equalToConstant: 150)
                                    ])
        
        sideMenuView.addSubview(footerView)
        NSLayoutConstraint.activate([footerView.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor, constant: -10),
                                     footerView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
                                     footerView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
                                     footerView.heightAnchor.constraint(equalToConstant: 100)
                                    ])
        
        sideMenuView.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
                                    ])
        
        
        headerView.addSubview(hiLabel)
        NSLayoutConstraint.activate([hiLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
                                     hiLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 80),
                                     hiLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -50),
                                     hiLabel.heightAnchor.constraint(equalToConstant: 25)
                                    ])
        
        headerView.addSubview(phraseLabel)
        NSLayoutConstraint.activate([phraseLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
                                     phraseLabel.topAnchor.constraint(equalTo: hiLabel.bottomAnchor, constant: 5),
                                     phraseLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -50),
                                     phraseLabel.heightAnchor.constraint(equalToConstant: 15)
                                    ])
        
        headerView.addSubview(authButton)
        NSLayoutConstraint.activate([authButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
                                     authButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 70),
                                     authButton.widthAnchor.constraint(equalToConstant: 50),
                                     authButton.heightAnchor.constraint(equalToConstant: 50)
                                    ])
    }
}
