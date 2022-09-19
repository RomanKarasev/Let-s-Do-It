//
//  UiKIt + UiButtons.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

extension UIButton {
    
    // MARK: FloatingButton
    
    static func setupFloatingButton() -> UIButton {
        let button = UIButton()
        let image = UIImage(named: Constants.buttonImage)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = Constants.imageEdgeInsets
        button.backgroundColor = UIColor.accentColor
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.shadowColor = UIColor.shadowColor.cgColor
        button.layer.shadowOpacity = Constants.shadowOpacity
        button.layer.shadowRadius = Constants.shadowRadius
        button.layer.shadowOffset = Constants.shadowOffset
        return button
    }
    
    static func setFloatingButtonConstraints(view: UIView, floatingButton: UIButton) {
        view.addSubview(floatingButton)
        NSLayoutConstraint.activate([
            floatingButton.widthAnchor.constraint(equalToConstant: CGFloat.floatingButtonWidthAnchor),
            floatingButton.heightAnchor.constraint(equalToConstant: CGFloat.floatingButtonHeightAnchor),
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: CGFloat.floatingButtonTrailingAnchor),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                   constant: CGFloat.floatingButtonBottomAnchor)]
        )
    }
    
    // MARK: CreateButton
    
    static func doCreateButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = Constants.cornerRadiusOfCreateButton
        button.backgroundColor = UIColor.mainColor
        button.setTitle("Create", for: .normal)
        button.titleLabel?.font = .appleSDGothicNeoDemiBold20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    

}


// MARK: - Constants

private struct Constants {
    
    static let buttonImage = "FloatingButton"
    static let cornerRadius: CGFloat = 30
    static let cornerRadiusOfCreateButton: CGFloat = 10
    static let shadowOpacity: Float = 0.4
    static let shadowRadius: CGFloat = 1
    static let shadowOffset: CGSize = .init(width: 2, height: 2)
    static let imageEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    
}

