//
//  BaseMainViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 21.09.2022.
//

import UIKit

class BaseMainViewController: UIViewController {
    
    
    // MARK: Properties
    let mainView = BaseMainView()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        
        navigationItem.largeTitleDisplayMode = .never

    }

    // MARK: Methods
    
    func addTargetToButtons(floatingButton: UIButton, leftButton: UIButton, rightButton: UIButton) {
        floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTabed), for: .touchUpInside)
    }
    
    
    @objc func addButtonTapped() {
    }
    
    @objc func leftButtonTapped() {
    }
    
    @objc func rightButtonTabed() {
    }
    
    func configureCell(cell: UITableViewCell, indexPath: IndexPath, array: [String]) -> UITableViewCell {
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = array[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.font = .appleSDGothicNeo20()
        return cell
    }
    
    func configureHeader(header: UITableViewHeaderFooterView) ->  UITableViewHeaderFooterView {
        header.textLabel?.text = "Lists:"
        header.textLabel?.textColor = .label
        header.textLabel?.font = .appleSDGothicNeoDemiBold30()
        return header
    }
}

