//
//  ConversionController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class ConversionViewController: UIViewController {

    private let alertService: AlertProvider = AlertProvider()

    var networkService: ConversionNetworkService

    var tableView = ConversionTableView(frame: .zero, style: .insetGrouped)

    //var conversionModel: ConversionModel?

    init(_ networkService: ConversionNetworkService) {
        self.networkService = networkService

        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(systemName: "dollarsign.circle")
        tabBarItem.title = "Conversion"
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Conversion"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        setupViews()
        setupConstraints()

        let completionHandler: ((ConversionModel?, Error?) -> Void) = { conversionData, error in
        }

        networkService.fetchCurrency(from: "EUR",
                                     amount: 1,
                                     to: "USD",
                                     completion: completionHandler)
    }

    private func setupViews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
