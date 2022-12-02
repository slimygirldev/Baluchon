//
//  WeatherViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class WeatherViewController: UIViewController {
//    let hour = Calendar.current.component(.hour, from: Date())

    private let alertService: AlertProvider = AlertProvider()

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

//        let actualdate = getHour()

        requestWeather(cityId: .paris)
        requestWeather(cityId: .newYork)

        setupViews()
        setupConstraints()
    }
//
//    private func getHour() -> String {
//        let date = Date() // save date, so all components use the same date
//        let calendar = Calendar.current // or e.g. Calendar(identifier: .persian)
//
//        let hour = calendar.component(.hour, from: date)
//        let minute = calendar.component(.minute, from: date)
//        let second = calendar.component(.second, from: date)
//        print("\(hour)h\(minute)")
//        return "\(hour)\(minute)"
//    }

    private func requestWeather(cityId: City) {
        // faire try pour renvoyer l'alerte
        networkService.fetchWeather(for: cityId, { weather, error  in

            guard error == nil else {
                // Network service envoit une erreur - ds ce scope je sais que error existe != nil
                DispatchQueue.main.async {
                    self.present(self.alertService.alertError(alertType: .fetchError), animated: true, completion: nil)
                }

                return
            }

            guard let unwrappedWeather = weather else {
                // weather est nil faire une erreur
                return
            }
            self.weatherModels.append(unwrappedWeather)
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
