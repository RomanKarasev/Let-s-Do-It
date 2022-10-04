////
////  TodayView.swift
////  Let's Do It
////
////  Created by Роман Карасёв on 03.08.2022.
////
//
//import UIKit
//
//// MARK: - TodayView
//
//class TodayView: UIView {
//    
//    // MARK: Properties
//    
//    var headerView = TableHeaderView(frame: CGRect(x: Constants.xFloat,
//                                                   y: Constants.yFloat,
//                                                   width: UIScreen.main.bounds.size.width,
//                                                   height: Constants.heightOfHeader))
//    
//    lazy var floatingButton = UIButton.setupFloatingButton()
//    
//    let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.bounces = false
//        tableView.backgroundColor = .clearColor
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//    
//    // MARK: Initialization
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: Methods
//    
//    private func setConstraints() {
//        
//        self.addSubview(headerView)
//        NSLayoutConstraint.activate(
//            [headerView.topAnchor.constraint(equalTo: self.topAnchor,
//                                             constant: Constants.headerViewTopAnchor),
//             headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//             headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//             headerView.heightAnchor.constraint(equalToConstant: Constants.heightOfHeader)
//            ]
//        )
//        
//        self.addSubview(tableView)
//        NSLayoutConstraint.activate(
//            [tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor,
//                                            constant: Constants.tableViewTopAnchor),
//             tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//             tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//             tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//            ]
//        )
//        
//        UIButton.setFloatingButtonConstraints(view: self, floatingButton: floatingButton)
//    }
//}
//
//// MARK: - Constants
//
//private struct Constants {
//    
//    static let xFloat: CGFloat = 0
//    static let yFloat: CGFloat = 90
//    static let heightOfHeader: CGFloat = 150
//    static let headerViewTopAnchor: CGFloat = 90
//    static let tableViewTopAnchor: CGFloat = 5
//    
//}
//
//
//
