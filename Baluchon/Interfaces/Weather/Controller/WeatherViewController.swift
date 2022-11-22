//
//  WeatherViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    var networkService: NetworkService
    var weatherModel: WeatherModel?

    let collectionView = WeatherCollectionView(frame: .zero,
                                               collectionViewLayout: UICollectionViewFlowLayout())

    init(_ networkService: NetworkService) {
        self.networkService = networkService
        // no Override Init and no convinence init to prevent the call of on of them in other place of the code
        // creating my own super init and satisfy apple init needs
        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(systemName: "cloud.sun")
        tabBarItem.title = "Weather"
    }

    //    convenience init(_ networkService: NetworkService) {
    //        self.init(nibName: nil, bundle: nil)
    //        self.networkService = networkService
    //    }
    //
    //    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    //        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    //            tabBarItem.image = UIImage(systemName: "cloud.sun")
    //            tabBarItem.title = "Weather"
    //    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .cyan

        requestWeahter()
        setupViews()
        setupConstraints()
    }

    private func requestWeahter() {
        networkService.requestWeather(for: "Paris", completionHandler: {
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
            self.weatherModel = WeatherModel(json: json)
            self.collectionView.model = self.weatherModel
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
