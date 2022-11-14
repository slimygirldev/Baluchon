//
//  TabBarViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    func setupVCs() {
        viewControllers = [
            UINavigationController(rootViewController: WeatherViewController()),
            UINavigationController(rootViewController: ConversionViewController()),
            UINavigationController(rootViewController: TranslationViewController()),
        ]
    }

}
