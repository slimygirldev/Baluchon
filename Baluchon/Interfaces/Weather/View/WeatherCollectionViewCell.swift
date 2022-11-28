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
        mainStackView.addArrangedSubview(cityNameLabel)
        mainStackView.addArrangedSubview(mainTempLabel)
        mainStackView.addArrangedSubview(weatherDescriptionLabel)

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(model: WeatherModel) {
        let celsius = Int(model.temp - 273.15)
        cityNameLabel.text = model.cityName
        mainTempLabel.text = "\(celsius)°"
        weatherDescriptionLabel.text = model.mainWeatherDescription
        print("le model est config")
    }
}
