//
//  TableHeaderView.swift
//  Let's Do It
//
//  Created by Роман Карасёв on 03.08.2022.
//

import UIKit
// MARK: - TableHeaderView

class TableHeaderView: UIView {
    
    // MARK: Properties
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Sunnys")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let weatherTemperatureLabel = UILabel(text: "C", font: .appleSDGothicNeoDemiBold50(), alignment: .center)
    let weatherRealTemperatureLabel = UILabel(text: "C", font: .appleSDGothicNeoDemiBold40(), alignment: .center)
    let temperatureLabel = UILabel(text: "Temperature now", font: .appleSDGothicNeo10(), alignment: .center)
    let feelTemperatureLabel = UILabel(text: "Feels like", font: .appleSDGothicNeo10(), alignment: .center)
    
    
    // MARK: viewForButton
    
    var showHourlyWeatherVCButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "moreInfo"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var viewForButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let dailyRainLabel = UILabel(text: "Chance of rain:", font: .appleSDGothicNeo14(), alignment: .right)
    let dailyRainData = UILabel(text: "", font: .appleSDGothicNeoDemiBold20(), alignment: .right)
    let windSpeedLabel = UILabel(text: "Chance of rain:", font: .appleSDGothicNeo14(), alignment: .right)
    let windSpeed = UILabel(text: "", font: .appleSDGothicNeoDemiBold20(), alignment: .right)
    
    
    // MARK: View Cyrcle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        self.addSubview(weatherImageView)
        NSLayoutConstraint.activate(
            [weatherImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
             weatherImageView.leadingAnchor.constraint(equalTo: self
                .leadingAnchor, constant: 40),
             weatherImageView.heightAnchor.constraint(equalToConstant: 80),
             weatherImageView.widthAnchor.constraint(equalToConstant: 80)
            ]
        )
        
        self.addSubview(weatherRealTemperatureLabel)
        NSLayoutConstraint.activate(
            [weatherRealTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             weatherRealTemperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
             weatherRealTemperatureLabel.widthAnchor.constraint(equalToConstant: 100)
            ]
        )
        
        self.addSubview(feelTemperatureLabel)
        NSLayoutConstraint.activate(
            [feelTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             feelTemperatureLabel.bottomAnchor.constraint(equalTo: weatherRealTemperatureLabel.topAnchor, constant: 0),
             feelTemperatureLabel.widthAnchor.constraint(equalToConstant: 100)
            ]
        )
        
        
        self.addSubview(weatherTemperatureLabel)
        NSLayoutConstraint.activate(
            [weatherTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             weatherTemperatureLabel.bottomAnchor.constraint(equalTo: feelTemperatureLabel.topAnchor, constant: 0),
             weatherTemperatureLabel.widthAnchor.constraint(equalToConstant: 100)
            ]
        )
        
        self.addSubview(temperatureLabel)
        NSLayoutConstraint.activate(
            [temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             temperatureLabel.bottomAnchor.constraint(equalTo: weatherTemperatureLabel.topAnchor, constant: 0),
             temperatureLabel.widthAnchor.constraint(equalToConstant: 100)
            ]
        )
        
        self.addSubview(showHourlyWeatherVCButton)
        NSLayoutConstraint.activate(
            [showHourlyWeatherVCButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             showHourlyWeatherVCButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             showHourlyWeatherVCButton.heightAnchor.constraint(equalToConstant: 40),
             showHourlyWeatherVCButton.widthAnchor.constraint(equalToConstant: 40)
            ]
        )
        
        self.addSubview(viewForButton)
        NSLayoutConstraint.activate(
            [viewForButton.bottomAnchor.constraint(equalTo: showHourlyWeatherVCButton.topAnchor, constant: 2),
             viewForButton.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 10),
             viewForButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             viewForButton.topAnchor.constraint(equalTo: self.topAnchor)
            ]
        )
        
    }
    
    func setWeatherData(from model: CurrentWeatherData) {
        DispatchQueue.main.async {
            let firstDayModelData = model.data[0]
            guard let temp = firstDayModelData.temp,
                    let realTemp = firstDayModelData.appearenceTemp,
                    let rain = firstDayModelData.clouds,
                    let imageName = firstDayModelData.weather?.description
            else { return }
            
            self.weatherTemperatureLabel.text = "\(temp) C"
            self.weatherRealTemperatureLabel.text = "\(realTemp) C"
            self.weatherImageView.image = UIImage(named: imageName)
            self.dailyRainData.text = "\(rain)"
        }
    }
}

