//
//  BaseNewViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 21.09.2022.
//


import UIKit

// MARK: - BaseNewViewController

class BaseNewViewController: UIViewController {
    
    
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        swipeForKeyboard()
        
    }
    
    // MARK: Methods
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    private func swipeForKeyboard() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    
    func configureCell(cell: UITableViewCell,
                       indexPath: IndexPath,
                       array: [[String]],
                       textField: UITextField,
                       textView: UITextView,
                       backgroundViewCell: UIView,
                       currentEvent: AnyObject?) {
        cell.textLabel?.text = array[indexPath.section][indexPath.row]
        cell.textLabel?.textColor = .label
        switch indexPath {
        case [0,0]:
            textField.isHidden = false
            textField.text = "Title"
            
        case [0,1]:
            textView.isHidden = false
            textView.text = "Body"
        default:
            break
        }
        
        textField.delegate = self
        
        if indexPath == [2,0] {
            backgroundViewCell.backgroundColor = .secondarySystemFill
        }
        
        guard let event = currentEvent
        else { return }
        
        switch indexPath {
        case [0,0]:
            textField.text = event.title
        case [0,1]:
            textField.text = event.body
        case [1,0]:
            cell.textLabel?.text = event.date
        case [1,1]:
            cell.textLabel?.text = event.time
        case [2,0]:
            break
            //            backgroundViewCell.backgroundColor = UIColor(named: reminder.color ?? "")
        default:
            break
        }
    }
    
    func setSection(section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 2
        case 2: return 1
        default: return 1
        }
    }
    
    func setHeightForRow(indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0,
           indexPath.row == 1 {
            return 88
        } else {
            return 44
        }
    }
}

extension BaseNewViewController: UITextFieldDelegate {
    
}


extension BaseNewViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
}

