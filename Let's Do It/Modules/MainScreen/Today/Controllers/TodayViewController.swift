//
//  TodayViewController.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit


class TodayViewController: UIViewController {
    
    // MARK: Properties
    
    // UiViews
    
    let todayView = TodayView()
    
    
    // MARK: Vie Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Today"
        
        configureTableView()
        
        todayView.floatingButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
//        headerView.showHourlyWeatherVCButton.addTarget(self, action: #selector(showHourlyVC), for: .touchUpInside)
        
        let apiKey = "68a88095881b42c999a25fdbb5f756a4"
        let baseURL = "https://api.weatherbit.io/v2.0/current"
        let pozition = "?city="
        let countOfDay = "&days=1"
        let apiID = "&NC&key="
        let city = "Saint-Petersburg"

        let currentWeatherURL = baseURL + pozition + city + apiID + apiKey

        print(currentWeatherURL)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        WeatherManager.getCurrentWeatherData(for: "Saint-Petersburg") { currentWeatherData in
            self.todayView.headerView.setWeatherData(from: currentWeatherData)
        }
    }
   
//    
//case Section.TrendingMovies.rawValue:
//            ApiCaller.shared.getTrendingMovies { result in
//                switch result {
//                case .success(let titles):
//                    cell.configure(with: titles)
//                case.failure(let error):
//                    print(error)
//                }
//            }
    
    override func loadView() {
        super.loadView()
        view = todayView
        view.backgroundColor = .systemGray4
    }

    
    // MARK: Methods
    
    @objc func showHourlyVC() {
////        let vc = HourlyWeatherViewController()
////        present(vc, animated: true)
    }
    
    func configureTableView() {
        todayView.tableView.delegate = self
        todayView.tableView.dataSource = self
        todayView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        let headerView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 150))
//        todayView.tableView.tableHeaderView = headerView
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
