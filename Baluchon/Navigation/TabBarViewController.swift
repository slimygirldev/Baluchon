//
//  TabBarViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    // Service/Depencies
    let networkService: NetworkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
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
