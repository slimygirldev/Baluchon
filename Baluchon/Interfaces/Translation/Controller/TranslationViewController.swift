//
//  TranslationViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TranslationViewController: UIViewController {

    var tableView = TranslationTableView(frame: .zero, style: .insetGrouped)

    var networkService: TranslationNetworkService

    lazy var switchLanguagesButton: UIBarButtonItem = {
        let switchLanguagesButton = UIBarButtonItem(title: "switch", style: .plain, target: self, action: #selector(handleSwitch))
        switchLanguagesButton.image = UIImage(systemName: "arrow.2.squarepath")
        switchLanguagesButton.tintColor = .systemBlue
        return switchLanguagesButton
    }()

    @objc func handleSwitch() {
        tableView.switchLanguages()
        print("languages switched")
    }

    init(_ networkService: TranslationNetworkService) {
        self.networkService = networkService

        super.init(nibName: nil, bundle: nil)
        tabBarItem.image = UIImage(systemName: "textformat.size")
        tabBarItem.title = "Translation"

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Translation"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        navigationItem.rightBarButtonItem = switchLanguagesButton

        tableView.translationDelegate = self
        setupViews()
        setupConstraints()

    }

    private func requestTranslation(model: TranslationFormModel) {
        let completionHandler: ((TranslationModel?, Error?) -> Void) = { model, error in

            self.tableView.translatedText = model?.translatedText ?? ""

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        networkService.fetchTranslationwithComponents(source: model.from,
                                                      target: model.to,
                                                      textToTranslate: model.text,
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

extension TranslationViewController: TranslationTableViewDelegate {
    func translationTableViewDelegateTappedConvertButton(model: TranslationFormModel) {
        requestTranslation(model: model)
    }
}
