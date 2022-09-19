//
//  NewHabitViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 10.08.2022.
//


import UIKit

// MARK: - NewHabitViewCell

class NewHabitViewCell: BaseNewViewCell {
    
    // MARK: Properties
    static let identifier = "NewHabitViewCell"
    
    var habit: Habit?
    
    let cellNameArray = [["", ""],
                         ["Date", "Time"],
                         ["Set Color"]]
    
    let textView: UITextView = {
        let tf = UITextView()
        tf.backgroundColor = .clear
        tf.textColor = .label
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
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
        setConstraints()
        textView.isHidden = true
        textField.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        
        addViews(backgroundViewCell: backgroundViewCell, textView: textView, textField: textField)
        
        let backgroundViewCellConstraintsArray: [NSLayoutConstraint] = setBackgroundViewCellConstraintsArray(backgroundViewCell: backgroundViewCell)
        let textViewConstraintsArray: [NSLayoutConstraint] = setTextViewConstraintsArray(textView: textView, backgroundViewCell: backgroundViewCell)
        let textFieldConstraintsArray: [NSLayoutConstraint] = setTextFieldConstraintsArray(textField: textField, backgroundViewCell: backgroundViewCell)
        
        NSLayoutConstraint.activate(backgroundViewCellConstraintsArray)
        NSLayoutConstraint.activate(textViewConstraintsArray)
        NSLayoutConstraint.activate(textFieldConstraintsArray)
    }
}



