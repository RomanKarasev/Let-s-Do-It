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
    
    private func setupTabBar() {
        let notesViewController = createNoteVC()
        let remindersViewController = createReminderVC()
        //        let calendarViewController =  createCalendarVC()
        let pomodoroViewController = createPomodoroVC()
        //        let todayViewController = createTodayVC()
        let habitViewController = createHabitVC()
        
        viewControllers = [
            remindersViewController,
            pomodoroViewController,
            habitViewController,
            notesViewController
        ]
        
        tabBar.tintColor = UIColor.accentColor
        tabBar.unselectedItemTintColor = UIColor.mainColor
        tabBar.backgroundColor = UIColor.tabBarBackgroundColor
    }
}
// MARK: - Private Methods

extension MainTabBarController {
    
    // MARK: createNavController
    
    private func createNavController(vc: UIViewController, itemName: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(),
                                tag: 0
        )
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
    
    // MARK: createCalendarVC
    //    private func createCalendarVC() -> ContainerViewController {
    //        let calendarViewController =  ContainerViewComposer.makeContainer()
    //        calendarViewController.tabBarItem.title = Constants.calendar
    //        calendarViewController.tabBarItem.image = UIImage(systemName: Constants.calendarImage)
    //        return calendarViewController
    //    }
    
    // MARK: createReminderVC
    private func createReminderVC() -> UINavigationController {
        let remindersViewController = createNavController(vc: AllRemindersViewController(store: RemindersStore(coreDataService: CoreDataService()), alertFactory: AlertFactory()), itemName: Constants.reminders)
        remindersViewController.tabBarItem.image = Constants.remindersImage
        return remindersViewController
    }
    
    // MARK: createPomodoroVC
    
    private func createPomodoroVC() -> UINavigationController {
        let remindersViewController = createNavController(vc: PomodoroViewController(), itemName: Constants.pomodoro)
        remindersViewController.tabBarItem.image = Constants.pomodoroImage
        return remindersViewController
    }
    
    // MARK: createTodayVC
    //    private func createTodayVC() -> UINavigationController {
    //        let todayViewController = createNavController(vc: TodayViewController(), itemName: Constants.today)
    //        todayViewController.tabBarItem.image = Constants.todayImage
    //        return todayViewController
    //    }
    
    // MARK: createHabitVC
    private func createHabitVC() -> UINavigationController {
        let vc = AllHabitsViewController(store: HabitsStore(coreDataService: CoreDataService()),
                                         alertFactory: AlertFactory())
        let habitViewController = createNavController(vc: vc,
                                                      itemName: Constants.habits)
        habitViewController.tabBarItem.image = Constants.habitsImage
        return habitViewController
    }
    
    // MARK: createNoteVC
    private func createNoteVC() -> UINavigationController {
        let notesViewController = createNavController(vc: AllNotesViewController(store: NotesStore(coreDataService: CoreDataService()),
                                                                                 alertFactory: AlertFactory()),
                                                      itemName: Constants.notes)
        notesViewController.tabBarItem.image = Constants.notesImage
        return notesViewController
    }
}


// MARK: - Constants

private struct Constants {
    
    static let calendar = "Calendar"
    static let reminders = "Reminders"
    static let habits = "Habits"
    static let today = "Today"
    static let notes = "Notes"
    static let pomodoro = "Pomodoro"
    
    
    static let calendarImage = UIImage(systemName: "calendar")
    static let remindersImage = UIImage(systemName: "calendar.badge.exclamationmark")
    static let habitsImage = UIImage(systemName: "note.text.badge.plus")
    static let todayImage = UIImage(systemName: "calendar.badge.clock")
    static let notesImage = UIImage(systemName: "note.text")
    static let pomodoroImage = UIImage(systemName: "timer")
    //
}
