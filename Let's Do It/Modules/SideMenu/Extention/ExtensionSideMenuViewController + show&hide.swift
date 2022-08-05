//
//  ExtensionSideMenuViewController + show&hide.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

extension SideMenuViewController {
    
    func show() {
        self.view.frame.origin.x = 0
        self.view.backgroundColor = UIColor.darkGray
        UIView.animate(withDuration: 0.2) {
            self.tabBarController?.tabBar.frame.origin.x = self.view.frame.size.width * 0.8
            self.tabBarController?.tabBar.backgroundColor = self.shadowColor
            self.leadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func hide() {
        self.view.backgroundColor = .clear
        UIView.animate(withDuration: 0.2) {
            self.tabBarController?.tabBar.frame.origin.x = 0
            self.tabBarController?.tabBar.backgroundColor = UIColor(named: "TapBarColor")
            self.leadingConstraint.constant = -self.screenWidth
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.view.frame.origin.x = -self.screenWidth
        }
    }
}
