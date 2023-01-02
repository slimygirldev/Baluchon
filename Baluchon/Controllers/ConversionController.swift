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

    lazy var switchCurrencyButton: UIBarButtonItem = {
        let switchCurrencyButton = UIBarButtonItem(title: "switch", style: .plain, target: self, action: #selector(handleSwitch))
        switchCurrencyButton.image = UIImage(systemName: "arrow.2.squarepath")
        switchCurrencyButton.tintColor = .systemBlue
        return switchCurrencyButton
    }()

    @objc func handleSwitch() {
        tableView.switchCurrency()
        print("currencies switched")
    }

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

        navigationItem.rightBarButtonItem = switchCurrencyButton

        tableView.conversionDelegate = self
        setupViews()
        setupConstraints()
    }

    private func requestConversion(model: FormModel) {
        let completionHandler: ((ConversionModel?, Error?) -> Void) = { model, error in
            self.tableView.result = model?.result ?? 0.0
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        networkService.fetchCurrency(from: model.from,
                                     amount: model.amount,
                                     to: model.to,
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

extension ConversionViewController: ConversionTableViewDelegate {
    func conversionTableViewDelegateTappedConvertButton(model: FormModel) {
        requestConversion(model: model)
    }
}
