//
//  NewHabitViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewHabitViewCell

class NewHabitViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Properties
    static let identifier = "NewHabitViewCell"
    
    var habit: Habit?
    
    let cellNameArray = [["", ""],
                         ["Date", "Time"],
                         ["Set Color"]]
    
    let tf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter"
        tf.textColor = .label
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    // Views
    
    let backgroundViewCell: UIView = {
       let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
   // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setConstraints()
        tf.isHidden = true
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Methods
    
//    func configureCell(cell: UITableViewCell, indexPath: IndexPath) {
//        cell.textLabel?.text = cellNameArray[indexPath.section][indexPath.row]
//        cell.textLabel?.textColor = .label
//        switch indexPath {
//        case [0,0]:
//            tf.isHidden = false
//            tf.text = "Title"
//            
//        case [0,1]:
//            tf.isHidden = false
//            tf.text = "Body"
//        default:
//            break
//        }
//        
//        tf.delegate = self
//        
//        if indexPath == [2,0] {
//            backgroundViewCell.backgroundColor = .secondarySystemFill
//        }
//
//        guard let habit = habit
//        else { return }
//
//        switch indexPath {
//        case [0,0]:
//            tf.text = habit.title
//        case [0,1]:
//            tf.text = habit.body
//        case [1,0]:
//            textLabel?.text = habit.date
//        case [1,1]:
//            textLabel?.text = habit.dayCount
//        case [2,0]:
//            break
////            backgroundViewCell.backgroundColor = UIColor(named: reminder.color ?? "")
//        default:
//            break
//        }
//    }
    
    // MARK: setConstraints
    
    func setConstraints() {

        contentView.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                                     backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                                     backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
                                    ])
        
        backgroundViewCell.addSubview(tf)
        NSLayoutConstraint.activate([tf.topAnchor.constraint(equalTo: backgroundViewCell.topAnchor),
                                     tf.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 10),
                                     tf.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor),
                                     tf.bottomAnchor.constraint(equalTo: backgroundViewCell.bottomAnchor)
                                    ])
    }
}


