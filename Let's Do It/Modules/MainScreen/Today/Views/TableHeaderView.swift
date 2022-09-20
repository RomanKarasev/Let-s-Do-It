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
    
    // MARK: setWeatherData
    
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
// MARK: - setConstraints

extension TableHeaderView {
    
    private func setConstraints() {
        self.addSubview(weatherImageView)
        NSLayoutConstraint.activate(
            [weatherImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
             weatherImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: Constants.weatherImageViewLeadingAnchor),
             weatherImageView.heightAnchor.constraint(equalToConstant: Constants.weatherImageViewHeightAnchor),
             weatherImageView.widthAnchor.constraint(equalToConstant: Constants.weatherImageViewWidthAnchor)
            ]
        )
        
        self.addSubview(weatherRealTemperatureLabel)
        NSLayoutConstraint.activate(
            [weatherRealTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             weatherRealTemperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             weatherRealTemperatureLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidthAncor)
            ]
        )
        
        self.addSubview(feelTemperatureLabel)
        NSLayoutConstraint.activate(
            [feelTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             feelTemperatureLabel.bottomAnchor.constraint(equalTo: weatherRealTemperatureLabel.topAnchor),
             feelTemperatureLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidthAncor)
            ]
        )
        
        
        self.addSubview(weatherTemperatureLabel)
        NSLayoutConstraint.activate(
            [weatherTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             weatherTemperatureLabel.bottomAnchor.constraint(equalTo: feelTemperatureLabel.topAnchor),
             weatherTemperatureLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidthAncor)
            ]
        )
        
        self.addSubview(temperatureLabel)
        NSLayoutConstraint.activate(
            [temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             temperatureLabel.bottomAnchor.constraint(equalTo: weatherTemperatureLabel.topAnchor),
             temperatureLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidthAncor)
            ]
        )
        
        self.addSubview(showHourlyWeatherVCButton)
        NSLayoutConstraint.activate(
            [showHourlyWeatherVCButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             showHourlyWeatherVCButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             showHourlyWeatherVCButton.heightAnchor.constraint(equalToConstant: Constants.showHourlyWeatherVCButtonHeightAnchor),
             showHourlyWeatherVCButton.widthAnchor.constraint(equalToConstant: Constants.showHourlyWeatherVCButtonWidthAnchor)
            ]
        )
        
        self.addSubview(viewForButton)
        NSLayoutConstraint.activate(
            [viewForButton.bottomAnchor.constraint(equalTo: showHourlyWeatherVCButton.topAnchor,
                                                   constant: Constants.viewForButtonBottomAnchor),
             viewForButton.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor,
                                                    constant: Constants.viewForButtonLeadingAnchor),
             viewForButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                     constant: Constants.viewForButtonTrailingAnchor),
             viewForButton.topAnchor.constraint(equalTo: self.topAnchor)
            ]
        )
    }
}

// MARK: - Constants

private struct Constants {
    
    static let weatherImageViewLeadingAnchor: CGFloat = 40
    static let weatherImageViewHeightAnchor: CGFloat = 80
    static let weatherImageViewWidthAnchor: CGFloat = 80
    static let labelWidthAncor: CGFloat = 100
    static let showHourlyWeatherVCButtonHeightAnchor: CGFloat = 40
    static let showHourlyWeatherVCButtonWidthAnchor: CGFloat = 40
    static let viewForButtonBottomAnchor: CGFloat = 2
    static let viewForButtonLeadingAnchor: CGFloat = 10
    static let viewForButtonTrailingAnchor: CGFloat = -5
    
}


