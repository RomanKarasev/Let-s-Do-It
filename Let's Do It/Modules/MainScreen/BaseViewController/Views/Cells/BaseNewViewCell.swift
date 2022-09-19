//
//  BaseNewViewCell.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 19.09.2022.
//

import UIKit

// MARK: - BaseNewViewCell

class BaseNewViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Properties
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func setView() {
        self.backgroundColor = .clearColor
        self.selectionStyle = .none
    }
    
    // MARK: Methods
    
    func setBackgroundViewCellConstraintsArray(backgroundViewCell: UIView) -> [NSLayoutConstraint] {
        let backgroundViewCellConstraintsArray: [NSLayoutConstraint] = [
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.backgroundViewCellLeadingAncor),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Constants.backgroundViewCellTrailingAnchor),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.backgroundViewCellBottomAnchor)]
        return backgroundViewCellConstraintsArray
    }
    
    func setTextViewConstraintsArray(textView: UITextView, backgroundViewCell: UIView) -> [NSLayoutConstraint] {
        let textViewConstraintsArray: [NSLayoutConstraint] = [
            textView.topAnchor.constraint(equalTo: backgroundViewCell.topAnchor),
            textView.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: Constants.textViewLeadingAnchor),
            textView.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: backgroundViewCell.bottomAnchor)
        ]
        return textViewConstraintsArray
    }
    
    func setTextFieldConstraintsArray(textField: UITextField, backgroundViewCell: UIView) -> [NSLayoutConstraint] {
        let textFieldConstraintsArray: [NSLayoutConstraint] = [
            textField.topAnchor.constraint(equalTo: backgroundViewCell.topAnchor),
            textField.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: Constants.textFieldLeadingAnchor),
            textField.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: backgroundViewCell.bottomAnchor)]
        return textFieldConstraintsArray
    }
    
    
    func addViews(backgroundViewCell: UIView, textView: UITextView, textField: UITextField) {
        
        contentView.addSubview(backgroundViewCell)
        backgroundViewCell.addSubview(textView)
        backgroundViewCell.addSubview(textField)
    }
}


// MARK: - Constants

private struct Constants {
    
    static let backgroundViewCellLeadingAncor: CGFloat = 10
    static let backgroundViewCellTrailingAnchor: CGFloat = -10
    static let backgroundViewCellBottomAnchor: CGFloat = -1
    static let textViewLeadingAnchor: CGFloat = 10
    static let textFieldLeadingAnchor: CGFloat = 10

    
}

