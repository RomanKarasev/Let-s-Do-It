////
////  TodayViewController.swift
////  Let's Do It
////
////  Created by Роман Карасёв on 03.08.2022.
////
//
//import UIKit
//
//
//class TodayViewController: UIViewController {
//    
//    // MARK: Properties
//   
//    let todayView = TodayView()
//    
//    var reminders = [Reminder]()
//    var habits = [Habit]()
//    var notes = [Note]()
//    
//    
//    // MARK: Vie Life Cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Today"
//        
//        configureTableView()
//        
//        todayView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
////
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        WeatherManager.getCurrentWeatherData(for: "Saint-Petersburg") { currentWeatherData in
//            self.todayView.headerView.setWeatherData(from: currentWeatherData)
//        }
//    }
// 
//    override func loadView() {
//        super.loadView()
//        view = todayView
//        view.backgroundColor = .systemBackground
//    }
//
//    // MARK: Methods
//    
//    @objc func showHourlyVC() {
//////        let vc = HourlyWeatherViewController()
//////        present(vc, animated: true)
//    }
//    
//    private func configureTableView() {
//        todayView.tableView.delegate = self
//        todayView.tableView.dataSource = self
//        todayView.tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: CalendarTableViewCell.identifier)
//        
//    }
//    
//    @objc func addButtonTapped() {
////        alertNewEvent()
//    }
//    
//    func reminderConfigureCell(cell: CalendarTableViewCell, indexPath: IndexPath) {
//        
//        cell.calendarIndex = indexPath
//        let indexOfArray = reminders[indexPath.row]
//        cell.calendarTitle.text = indexOfArray.title
//        cell.calendarBody.text = indexOfArray.body
//        cell.calendarDate.text = indexOfArray.date
//        cell.calendarTime.text = indexOfArray.time
//    }
//    
//    func habitConfigureCell(cell: CalendarTableViewCell, indexPath: IndexPath) {
//        
//        cell.calendarIndex = indexPath
//        let indexOfArray = habits[indexPath.row]
//        cell.calendarTitle.text = indexOfArray.title
//        cell.calendarBody.text = indexOfArray.body
//        cell.calendarDate.text = indexOfArray.date
////        guard let image = indexOfArray.image else { return }
////        cell.habitImageView.image = UIImage(named: image)
//    }
//    
//    func noteConfigureCell(cell: CalendarTableViewCell, indexPath: IndexPath) {
//        
//        cell.calendarIndex = indexPath
//        let indexOfArray = notes[indexPath.row]
//        cell.calendarTitle.text = indexOfArray.title
//        cell.calendarBody.text = indexOfArray.body
//        cell.calendarDate.text = indexOfArray.date
//        cell.calendarTime.text = indexOfArray.time
//    }
//}
//
//// MARK: - UITableViewDelegate, UITableViewDataSource
//
//extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: CalendarTableViewCell.identifier,
//            for: indexPath
//        ) as! CalendarTableViewCell
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 115
//    }
//}
