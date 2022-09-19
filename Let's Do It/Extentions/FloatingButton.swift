//
//  FloatingButton.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 19.09.2022.
//

import UIKit

class FloatingButton: UIButton {
    
    static let shared = FloatingButton()
    lazy var floatingButton = UIButton.setupFloatingButton()
    
    
    func setConstraints(view: UIView) {
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
    
//    func setAddTarget(self: AnyObject, action: UIAction) {
//        floatingButton.addTarget(self, action: #selector(action), for: .touchUpInside )
//    }
}
