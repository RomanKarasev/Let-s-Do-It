//
//  SideMenuView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - SideMenuView

class SideMenuView: UIView {
    
    // MARK: Properties
    
    var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clearColor
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clearColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var sideMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clearColor
        return view
    }()
    
    var hiLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForHiLabel
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
    
    lazy var authButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.imageForAuthButton, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Init
    
    init() {
        super.init(frame: .zero)
        
        configureConstraints()
        
        backgroundColor = UIColor.clearColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Private Methods

extension SideMenuView {
    
    
    
    private func configureConstraints() {
        
        self.addSubview(sideMenuView)
        NSLayoutConstraint.activate(
            [sideMenuView.topAnchor.constraint(equalTo: self.topAnchor),
             sideMenuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             sideMenuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             sideMenuView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
        
        
        sideMenuView.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: sideMenuView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.headerViewHeight)
        ]
        )
        
        sideMenuView.addSubview(footerView)
        NSLayoutConstraint.activate(
            [footerView.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor,
                                                constant: Constants.footerViewBottom
                                               ),
             footerView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
             footerView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
             footerView.heightAnchor.constraint(equalToConstant: Constants.footerViewHeight)
            ]
        )
        
        sideMenuView.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
             tableView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
            ]
        )
        
        
        headerView.addSubview(hiLabel)
        NSLayoutConstraint.activate(
            [hiLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,
                                              constant: Constants.hiLabelLeadingAncor
                                             ),
             hiLabel.topAnchor.constraint(equalTo: headerView.topAnchor,
                                          constant: Constants.hiLabelTopAncor
                                         ),
             hiLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,
                                               constant: Constants.hiLabelTrailingAncor
                                              ),
             hiLabel.heightAnchor.constraint(equalToConstant: Constants.hiLabelHeightAnchor)
            ]
        )
        
        headerView.addSubview(phraseLabel)
        NSLayoutConstraint.activate(
            [phraseLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,
                                                  constant: Constants.phraseLabelLeadingAncor
                                                 ),
             phraseLabel.topAnchor.constraint(equalTo: hiLabel.bottomAnchor,
                                              constant: Constants.phraseLabelTopAncor
                                             ),
             phraseLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,
                                                   constant: Constants.phraseLabelTrailingAncor),
             phraseLabel.heightAnchor.constraint(equalToConstant: Constants.phraseLabelHeightAnchor)
            ]
        )
        
        headerView.addSubview(authButton)
        NSLayoutConstraint.activate(
            [authButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,
                                                  constant: Constants.authButtonTrailingAncor
                                                 ),
             authButton.topAnchor.constraint(equalTo: headerView.topAnchor,
                                             constant: Constants.authButtonTopAncor
                                            ),
             authButton.widthAnchor.constraint(equalToConstant: Constants.authButtonWidthAncor),
             authButton.heightAnchor.constraint(equalToConstant: Constants.authButtonHeightAnchor)
            ]
        )
    }
}

// MARK: - Constants

private struct Constants {
    
    static let textForHiLabel = "Hi, User"
    
    static let imageForAuthButton = UIImage(systemName: "person")
    
    
    static let headerViewHeight: CGFloat = 150
    
    static let footerViewHeight: CGFloat = 100
    static let footerViewBottom: CGFloat = -10
    
    static let hiLabelLeadingAncor: CGFloat = 20
    static let hiLabelTopAncor: CGFloat = 80
    static let hiLabelTrailingAncor: CGFloat = -50
    static let hiLabelHeightAnchor: CGFloat = 25
    
    static let phraseLabelLeadingAncor: CGFloat = 20
    static let phraseLabelTopAncor: CGFloat = 5
    static let phraseLabelTrailingAncor: CGFloat = -50
    static let phraseLabelHeightAnchor: CGFloat = 15
    
    static let authButtonWidthAncor: CGFloat = 50
    static let authButtonTopAncor: CGFloat = 70
    static let authButtonTrailingAncor: CGFloat = -20
    static let authButtonHeightAnchor: CGFloat = 50
    
    
}

