//
//  WeatherCollectionViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifer = "WeatherCollectionViewCell"

    let cityNameLabel: UILabel = {
        let cityNameLabel = UILabel()
        cityNameLabel.font = .systemFont(ofSize: 36)
        cityNameLabel.textColor = .white
        cityNameLabel.text = "Default"
        cityNameLabel.layer.shadowOpacity = 0.25
        cityNameLabel.layer.shadowRadius = 4
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityNameLabel
    }()

    let weatherDescriptionLabel: UILabel = {
        let weatherLabel = UILabel()
        weatherLabel.font = .systemFont(ofSize: 22)
        weatherLabel.textColor = .white
        weatherLabel.text = "Cloudy"
        weatherLabel.layer.shadowOpacity = 0.25
        weatherLabel.layer.shadowRadius = 4
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        return weatherLabel
    }()

    let mainTempLabel: UILabel = {
        let mainTempLabel = UILabel()
        mainTempLabel.font = .systemFont(ofSize: 70)
        mainTempLabel.textColor = .white
        mainTempLabel.text = "Default"
        mainTempLabel.layer.shadowOpacity = 0.25
        mainTempLabel.layer.shadowRadius = 4
        mainTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainTempLabel
    }()

    let minTempLabel: UILabel = {
        let minTempLabel = UILabel()
        minTempLabel.font = .systemFont(ofSize: 20)
        minTempLabel.textColor = .white
        minTempLabel.text = "Default"
        minTempLabel.layer.shadowOpacity = 0.25
        minTempLabel.layer.shadowRadius = 4
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return minTempLabel
    }()

    let maxTempLabel: UILabel = {
        let maxTempLabel = UILabel()
        maxTempLabel.font = .systemFont(ofSize: 20)
        maxTempLabel.textColor = .white
        maxTempLabel.text = "Default"
        maxTempLabel.layer.shadowOpacity = 0.25
        maxTempLabel.layer.shadowRadius = 4
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return maxTempLabel
    }()

    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis  = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .clear
        return mainStackView
    }()

    let minMaxTemphorizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .center
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.backgroundColor = .clear
        return horizontalStackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.masksToBounds = true
        addViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(mainStackView)

        minMaxTemphorizontalStackView.addArrangedSubview(maxTempLabel)
        minMaxTemphorizontalStackView.addArrangedSubview(minTempLabel)

        mainStackView.addArrangedSubview(cityNameLabel)
        mainStackView.addArrangedSubview(mainTempLabel)
        mainStackView.addArrangedSubview(weatherDescriptionLabel)
        mainStackView.addArrangedSubview(minMaxTemphorizontalStackView)


        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func kelvinToCelsius(kelvin: Double) -> Int {
        guard kelvin >= 0 else {
            return 0
        }
        let celsius = Int(kelvin - 273.15)
        return celsius
    }

    func configure(model: WeatherModel) {
        let celsiusForMainTemp = kelvinToCelsius(kelvin: model.temp)
        let celsiusForMinTemp = kelvinToCelsius(kelvin: model.tempMin)
        let celsiusForMaxTemp = kelvinToCelsius(kelvin: model.tempMax)
        cityNameLabel.text = model.cityName
        mainTempLabel.text = "\(celsiusForMainTemp)°"
        minTempLabel.text = "L: \(celsiusForMinTemp)°"
        maxTempLabel.text = "H: \(celsiusForMaxTemp)°"
        weatherDescriptionLabel.text = model.mainWeatherDescription

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        gradientLayer.colors = model.setBackgroundColor(hour: Calendar.current.component(.hour, from: Date()))
        contentView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
