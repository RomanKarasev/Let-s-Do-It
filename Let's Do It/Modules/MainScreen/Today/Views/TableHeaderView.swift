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
    
    static let identifier = "TableHeaderView"
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Sunnys")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let weatherTemperatureLabel = UILabel(text: "C", font: .appleSDGothicNeoDemiBold20(), alignment: .center)
    let weatherRealTemperatureLabel = UILabel(text: "C", font: .appleSDGothicNeoDemiBold20(), alignment: .center)
    let temperatureLabel = UILabel(text: "Temperature now", font: .appleSDGothicNeo10(), alignment: .center)
    let feelTemperatureLabel = UILabel(text: "Feels like", font: .appleSDGothicNeo10(), alignment: .center)
    
    
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
                  let imageName = firstDayModelData.weather?.description
            else { return }
            
            self.weatherTemperatureLabel.text = "\(temp) C"
            self.weatherRealTemperatureLabel.text = "\(realTemp) C"
            self.weatherImageView.image = UIImage(named: imageName)
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
            [feelTemperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             feelTemperatureLabel.centerYAnchor.constraint(equalTo: weatherRealTemperatureLabel.centerYAnchor),
             feelTemperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
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
            [temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
             temperatureLabel.centerYAnchor.constraint(equalTo: weatherTemperatureLabel.centerYAnchor),
             temperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             temperatureLabel.widthAnchor.constraint(equalToConstant: Constants.labelWidthAncor)
            ]
        )
    }
}

// MARK: - Constants

private struct Constants {
    
    static let weatherImageViewLeadingAnchor: CGFloat = 10
    static let weatherImageViewHeightAnchor: CGFloat = 50
    static let weatherImageViewWidthAnchor: CGFloat = 50
    static let labelWidthAncor: CGFloat = 100
    
}


