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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        setupVCs()
    }

    func setupVCs() {
        viewControllers = [
            UINavigationController(rootViewController: WeatherViewController(networkService)),
//            WeatherViewController(networkService),
            UINavigationController(rootViewController: ConversionViewController()),
            UINavigationController(rootViewController: TranslationViewController()),
        ]
        viewControllers?.forEach {
            $0.edgesForExtendedLayout = []
        }
    }

}
