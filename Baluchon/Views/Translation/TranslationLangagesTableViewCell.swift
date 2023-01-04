//
//  TranslationOrginLangageTableViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/12/2022.
//

import UIKit

class TranslationLangagesTableViewCell: UITableViewCell {
    static let reuseIdentifier = "TranslationLangagesTableViewCell"

    let langageLabel: UILabel = {
        let langageLabel = UILabel()
        langageLabel.text = Languages.fr.rawValue
        langageLabel.font = .systemFont(ofSize: 20)
        langageLabel.translatesAutoresizingMaskIntoConstraints = false
        return langageLabel
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .lightGray
        titleLabel.text = "Default :"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fill
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10,
                                                                     bottom: 10, right: 10))
    }

    func configure(title: String, langage: String) {
        titleLabel.text = title
        langageLabel.text = langage
    }

    private func addViews() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(langageLabel)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant : 20),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

