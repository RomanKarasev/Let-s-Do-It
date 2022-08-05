//
//  ApiModel.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 04.08.2022.
//

import Foundation

struct CurrentWeatherData: Decodable {
    let data: [WeatherData]
}

struct WeatherData: Decodable {
    let temp: Double?
    let appearenceTemp: Double?
    let windSpeed: Double?
    let weather: WeatherIcon?
    let clouds: Double?
    
    
    enum CodingKeys: String, CodingKey {
        
        case temp
        case appearenceTemp = "app_temp"
        case windSpeed = "wind_spd"
        case weather
        case clouds
    }
}

struct WeatherIcon: Decodable {
    
    let icon: String?
    let code: Double?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        
        case icon
        case code
        case description
    }
    
}
