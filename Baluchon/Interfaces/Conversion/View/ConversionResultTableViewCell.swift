//
//  ConversionResultTableViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 10/12/2022.
//

import UIKit

class ConversionResultTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ConversionResultTableViewCell"

    let textResult: UILabel = {
        let textField = UILabel()
        textField.text = "0.0"
        textField.font = .systemFont(ofSize: 40)
        textField.backgroundColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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

        mainStackView.addArrangedSubview(textResult)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
