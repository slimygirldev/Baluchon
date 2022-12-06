//
//  TabBarViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    // Service/Depencies
    let networkService: NetworkWeatherService = NetworkWeatherService()
    let conversionNetworkService: ConversionNetworkService = ConversionNetworkService()

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
            UINavigationController(rootViewController: WeatherViewController(networkService)),
            UINavigationController(rootViewController: ConversionViewController(conversionNetworkService)),
            UINavigationController(rootViewController: TranslationViewController()),
        ]
        viewControllers?.forEach {
            $0.edgesForExtendedLayout = []
        }
    }

}
