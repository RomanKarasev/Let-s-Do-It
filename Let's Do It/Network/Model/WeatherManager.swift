//
//  WeatherManager.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 04.08.2022.
//

import Foundation

// MARK: - Weather API Service
//https://api.weatherbit.io/v2.0/forecast/daily?city=Raleigh,NC&key=API_KEY
//https://api.weatherbit.io/v2.0/forecast/daily?city=Saint-Petersburg&days=2&NC&key=68a88095881b42c999a25fdbb5f756a4
    
///
final class WeatherManager {

    // MARK: Endpoints

    private enum Endpoints {

        case currentWeather(city: String)
        
        var stringValue: String {
            switch self {
            case .currentWeather(let city):
                return baseURL + pozition + city + apiID + apiKey
            }
        }
    }

    // MARK: Properties

    static let apiKey = "68a88095881b42c999a25fdbb5f756a4"
    static let baseURL = "https://api.weatherbit.io/v2.0/current"
    static let pozition = "?city="
    static let countOfDay = "&days=1"
    static let apiID = "&NC&key="

    // MARK: Methods

    static func getCurrentWeatherData(for city: String, _ completion: @escaping (CurrentWeatherData) -> Void) {
        let urlString = Endpoints.currentWeather(city: city).stringValue

        guard let url = URL(string: urlString) else { return }

        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let responseObject = try JSONDecoder().decode(CurrentWeatherData.self, from: data)
                completion(responseObject)
            } catch let error as NSError {
                print(error.userInfo)
            }
        }
            task.resume()
    }

    // TODO: - сделать общую функцию для отправки GET запросов
    // TODO: - сделать общую функцию для парсинга JSON
}

