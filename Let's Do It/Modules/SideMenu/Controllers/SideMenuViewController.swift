//
//  SideMenuViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//


import UIKit

// MARK: - SideMenuViewController

class SideMenuViewController: UIViewController {
    
    // MARK: Properties
    
    let sideMenuView = SideMenuView()
    var screenWidth: CGFloat { view.frame.size.width }
    var leadingConstraint: NSLayoutConstraint!
    var leadingViewConstraint: NSLayoutConstraint!
    var shadowColor: UIColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.5)
    private var sideMenuItems: [SideMenuItem] = []
    weak var delegate: SideMenuDelegate?
    
    
    // MARK: Init
    
    convenience init(sideMenuItems: [SideMenuItem]) {
        self.init()
        self.sideMenuItems = sideMenuItems
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame.origin.x = -screenWidth
        
        configureConstraints()
        configureTableView()
        configureTapGesture()
        sideMenuView.authButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
        
    }
    
    
    // MARK: Methods
    
    @objc private func authButtonTapped() {
        present(AuthViewController(), animated: true)
    }
    
    private func configureTableView() {
        sideMenuView.tableView.register(SideMenuItemCell.self, forCellReuseIdentifier: SideMenuItemCell.identifier)
        sideMenuView.tableView.dataSource = self
        sideMenuView.tableView.delegate = self
        sideMenuView.tableView.bounces = false
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapped() {
        hide()
    }
}

// MARK: - UIGestureRecognizerDelegate

extension SideMenuViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else { return false }
        if view === sideMenuView.headerView || view.isDescendant(of: sideMenuView.tableView) {
            return false
        }
        return true
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sideMenuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuItemCell.identifier, for: indexPath) as? SideMenuItemCell else {
            fatalError("Could not dequeue cell")
        }
        let item = sideMenuItems[indexPath.row]
        cell.configureCell(icon: item.icon, text: item.name)
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let item = sideMenuItems[indexPath.row]
        delegate?.itemSelected(item: item.viewController)
    }
}

// MARK: - SetConstraints

extension SideMenuViewController {
    
    private func configureConstraints() {

        view.addSubview(sideMenuView)
        leadingConstraint = sideMenuView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -view.frame.size.width)

        NSLayoutConstraint.activate(
            [sideMenuView.topAnchor.constraint(equalTo: view.topAnchor),
             leadingConstraint,
             sideMenuView.widthAnchor.constraint(equalToConstant: view.frame.size.width * 0.8),
             sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
}




