//
//  WeatherViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    var networkService: NetworkWeatherService

    var weatherModels: [WeatherModel] = []

    let collectionView = WeatherCollectionView(frame: .zero,
                                               collectionViewLayout: UICollectionViewFlowLayout())

    init(_ networkService: NetworkWeatherService) {
        self.networkService = networkService

        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(systemName: "cloud.sun")
        tabBarItem.title = "Weather"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        requestWeather(cityId: .paris)
        requestWeather(cityId: .newYork)

        setupViews()
        setupConstraints()
    }

    private func requestWeather(cityId: City) {
        networkService.fetchWeather(for: cityId, { weather in
            self.weatherModels.append(weather)
            self.collectionView.models = self.weatherModels
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }

    private func setupViews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
