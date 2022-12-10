//
//  ConversionCurrencyTableViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 10/12/2022.
//

import UIKit

class ConversionCurrencyTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ConversionCurrencyTableViewCell"

    let textCurrency: UILabel = {
        let textField = UILabel()
        textField.text = "EUR"
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .lightGray
        titleLabel.text = "Default"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .green
        return titleLabel
    }()

    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.alignment = .leading
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .magenta
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

    private func addViews() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(textCurrency)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
