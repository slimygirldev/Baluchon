//
//  TabBarViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    // Service/Depencies
    let weatherNetworkService: NetworkWeatherService = NetworkWeatherService(networkClient: .shared)
    let conversionNetworkService: ConversionNetworkService = ConversionNetworkService(networkClient: .shared)
    let translationNetworkService: TranslationNetworkService = TranslationNetworkService(networkClient: .shared)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        self.tabBar.backgroundColor = .systemBackground
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        setupVCs()
    }

    func setupVCs() {
        viewControllers = [
            UINavigationController(rootViewController: WeatherViewController(weatherNetworkService)),
            UINavigationController(rootViewController: ConversionViewController(conversionNetworkService)),
            UINavigationController(rootViewController: TranslationViewController(translationNetworkService)),
        ]
        viewControllers?.forEach {
            $0.edgesForExtendedLayout = []
        }
    }
}
