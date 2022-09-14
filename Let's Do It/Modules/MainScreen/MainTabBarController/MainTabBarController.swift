//
//  MainTabBarController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//


import UIKit

// MARK: - MainTabBarController

class MainTabBarController: UITabBarController {
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: Methods
    
    func setupTabBar() {
        let notesViewController = createNoteVC()
        let remindersViewController = createReminderVC()
        let calendarViewController =  createCalendarVC()
        let todayViewController = createTodayVC()
        let habitViewController = createHabitVC()
        
        viewControllers = [calendarViewController,
                           remindersViewController,
                           todayViewController,
                           habitViewController,
                           notesViewController]
        tabBar.tintColor = .systemOrange
        tabBar.unselectedItemTintColor = .systemBlue
        tabBar.backgroundColor = .systemBackground
        tabBar.layer.opacity = 0.98
    }
    
    // MARK: createNavController
    
    func createNavController(vc: UIViewController, itemName: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(),
                                tag: 0
        )
        item.titlePositionAdjustment = .init(horizontal: 0,
                                             vertical: 5
        )
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
    
    // MARK: createCalendarVC
    func createCalendarVC() -> ContainerViewController {
        let calendarViewController =  ContainerViewComposer.makeContainer()
        calendarViewController.tabBarItem.title = "Calendar"
        calendarViewController.tabBarItem.titlePositionAdjustment = .init(horizontal: 0,
                                                                          vertical: 5)
        calendarViewController.tabBarItem.image = UIImage(systemName: "calendar")
        return calendarViewController
    }
    
    // MARK: createReminderVC
    func createReminderVC() -> UINavigationController {
        let remindersViewController = createNavController(vc: RemindersMainViewController(), itemName: "Reminders")
        remindersViewController.tabBarItem.image = UIImage(systemName: "calendar.badge.exclamationmark")
        return remindersViewController
    }
    
    // MARK: createTodayVC
    func createTodayVC() -> UINavigationController {
        let todayViewController = createNavController(vc: TodayViewController(), itemName: "Today")
        todayViewController.tabBarItem.image = UIImage(systemName: "calendar.badge.clock")
        return todayViewController
    }
    
    // MARK: createHabitVC
    func createHabitVC() -> UINavigationController {
        let vc = AllHabitsViewController(store: HabitsStore(coreDataService: CoreDataService()), alertFactory: AlertFactory())
        let habitViewController = createNavController(vc: vc,
                                                      itemName: "Habit")
        habitViewController.tabBarItem.image = UIImage(systemName: "note.text.badge.plus")
        return habitViewController
    }
    
    // MARK: createNoteVC
    func createNoteVC() -> UINavigationController {
        let notesViewController = createNavController(vc: NotesMainViewController(), itemName: "Notes")
        notesViewController.tabBarItem.image = UIImage(systemName: "note.text")
        return notesViewController
    }
}



