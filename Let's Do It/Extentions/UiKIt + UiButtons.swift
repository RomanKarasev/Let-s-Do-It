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
        let image = UIImage(named: "FloatingButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor(named: "FloatingButtonColor")
        button.layer.cornerRadius = 60 / 2
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 1
        button.layer.shadowOffset = .init(width: 2, height: 2)
        return button
    }
    
    // MARK: CreateButton
    
    static func doCreateButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "FloatingButtonColor")
        button.setTitle("Create", for: .normal)
        button.titleLabel?.font = .appleSDGothicNeoDemiBold20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

}
//
//extension UIButton {
//
//    func setDoneStatus() {
//
////        self.setBackgroundImage(UIImage(named: "confirm_tick"), for: .normal)
////        button.addSubview(cellDoneImageView)
////        cellDoneImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
////        cellDoneImageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
//    }
//}

