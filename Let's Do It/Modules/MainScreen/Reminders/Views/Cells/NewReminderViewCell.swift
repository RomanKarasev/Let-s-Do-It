//
//  NewReminderViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewReminderTableViewCell

class NewReminderTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Properties
    static let identifier = "NewReminderTableViewCell"
    
    var reminder: Reminder?
    
    let cellNameArray = [["", ""],
                         ["Date", "Time"],
                         ["Set Color"]]
    
    let tf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "???"
        tf.textColor = .label
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
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
    
    private func setConstraints() {
        
        contentView.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate(
            [backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
             backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
             backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
             backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
            ]
        )
        
        backgroundViewCell.addSubview(tf)
        NSLayoutConstraint.activate(
            [tf.topAnchor.constraint(equalTo: backgroundViewCell.topAnchor),
             tf.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 10),
             tf.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor),
             tf.bottomAnchor.constraint(equalTo: backgroundViewCell.bottomAnchor)
            ]
        )
    }
}



