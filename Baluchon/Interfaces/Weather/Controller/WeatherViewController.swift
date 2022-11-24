//
//  WeatherViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    var networkService: NetworkService
    var weatherModels: [WeatherModel?] = []

    let collectionView = WeatherCollectionView(frame: .zero,
                                               collectionViewLayout: UICollectionViewFlowLayout())

    init(_ networkService: NetworkService) {
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

        requestWeahter(city: "Paris")
        requestWeahter(city: "New York")

        setupViews()
        setupConstraints()
    }

    private func requestWeahter(city: String) {
        networkService.requestWeather(for: city, completionHandler: {
            data in
            // -> 59 to move in NetworkService
            guard let data = data else {
                print("no data founded")
                return
            }

            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

            guard let json = json else {
                print("no json")
                return
            }
            self.weatherModels.append(WeatherModel(json: json))
            self.collectionView.models = self.weatherModels
            // asynchrone : refresh all - reload data (à faire après le model car on sait qu'à ce moment là il existe)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
    
            // retain cycle à voir = gestion de memoire
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
