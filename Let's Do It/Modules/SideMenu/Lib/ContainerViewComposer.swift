//
//  ContainerViewComposer.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit

// MARK: - ContainerViewComposer

final class ContainerViewComposer {
    
    
    // MARK: Methods
  
    static func makeContainer() -> ContainerViewController {
        
        
        let calendarViewController = CalendarViewController()
        let pomodoroViewController = PomodoroViewController()
        let settingsViewController = SettingsViewController()
//        let myAccountViewController = MyAccountViewController()
        let sideMenuItems = [
            SideMenuItem(icon: UIImage(systemName: "calendar"),
                         name: "Calendar",
                         viewController: .push(calendarViewController)),
            SideMenuItem(icon: UIImage(systemName: "clock.arrow.2.circlepath"),
                         name: "Pomodoro",
                         viewController: .embed(pomodoroViewController)),
            SideMenuItem(icon: UIImage(systemName: "gear"),
                         name: "Settings",
                         viewController: .push(settingsViewController)),
//            SideMenuItem(icon: UIImage(systemName: "person"),
//                         name: "My Account",
//                         viewController: .modal(myAccountViewController))
        ]
        let sideMenuViewController = SideMenuViewController(sideMenuItems: sideMenuItems)
        
        let container = ContainerViewController(sideMenuViewController: sideMenuViewController,
                                                rootViewController: calendarViewController)
        return container
    }
}
