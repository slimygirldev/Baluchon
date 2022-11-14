//
//  ConversionController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class ConversionViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage(systemName: "dollarsign.circle")
        tabBarItem.title = "Conversion"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Conversion"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
