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
        cityNameLabel.textColor = .black
        cityNameLabel.text = "Default"
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityNameLabel
    }()

    let weatherDescriptionLabel: UILabel = {
        let weatherLabel = UILabel()
        weatherLabel.font = .systemFont(ofSize: 22)
        weatherLabel.textColor = .black
        weatherLabel.text = "Cloudy"
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        return weatherLabel
    }()

    let mainTempLabel: UILabel = {
        let mainTempLabel = UILabel()
        mainTempLabel.font = .systemFont(ofSize: 70)
        mainTempLabel.textColor = .black
        mainTempLabel.text = "Default"
        mainTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainTempLabel
    }()

    let minTempLabel: UILabel = {
        let mainTempLabel = UILabel()
        mainTempLabel.font = .systemFont(ofSize: 20)
        mainTempLabel.textColor = .black
        mainTempLabel.text = "Default"
        mainTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainTempLabel
    }()

    let maxTempLabel: UILabel = {
        let mainTempLabel = UILabel()
        mainTempLabel.font = .systemFont(ofSize: 20)
        mainTempLabel.textColor = .black
        mainTempLabel.text = "Default"
        mainTempLabel.translatesAutoresizingMaskIntoConstraints = false
        return mainTempLabel
    }()

    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis  = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .purple
        return mainStackView
    }()

    let minMaxTemphorizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .center
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.backgroundColor = .yellow
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
        minTempLabel.text = "L:\(celsiusForMinTemp)°"
        maxTempLabel.text = "H:\(celsiusForMaxTemp)°"
        weatherDescriptionLabel.text = model.mainWeatherDescription
        print("le model est config")
    }
}
