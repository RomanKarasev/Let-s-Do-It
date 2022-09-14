//
//  TodayViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit


class TodayViewController: UIViewController {
    
    // MARK: Properties
   
    let todayView = TodayView()
    
    // MARK: Vie Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Today"
        
        configureTableView()
        
        todayView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
//
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        WeatherManager.getCurrentWeatherData(for: "Saint-Petersburg") { currentWeatherData in
            self.todayView.headerView.setWeatherData(from: currentWeatherData)
        }
    }
 
    override func loadView() {
        super.loadView()
        view = todayView
        view.backgroundColor = .systemBackground
    }

    // MARK: Methods
    
    @objc func showHourlyVC() {
////        let vc = HourlyWeatherViewController()
////        present(vc, animated: true)
    }
    
    private func configureTableView() {
        todayView.tableView.delegate = self
        todayView.tableView.dataSource = self
        todayView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @objc func addButtonTapped() {
//        alertNewEvent()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "Ура"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
