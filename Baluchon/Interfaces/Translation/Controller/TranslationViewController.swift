//
//  TranslationViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TranslationViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.image = UIImage(systemName: "textformat.size")
        tabBarItem.title = "Translation"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Translation"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
