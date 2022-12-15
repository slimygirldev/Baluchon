//
//  TranslationViewController.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import UIKit

class TranslationViewController: UIViewController {

    var tableView = TranslationTableView(frame: .zero, style: .insetGrouped)

//    let translationView = TranslationView()

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
        view.backgroundColor = .systemBackground
        title = "Translation"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

        setupViews()
        setupConstraints()
    }
//
//    private func setupViews() {
//        translationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(translationView)
//    }
//
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            translationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            translationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            translationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            translationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }

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
