//
//  ConversionValueTableViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 10/12/2022.
//

import UIKit

class ConversionValueTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ConversionValueTableViewCell"

    let textField: UITextField = {
        let textField = UITextField()
        textField.text = "0.0"
        textField.font = .systemFont(ofSize: 40)
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillProportionally
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

    private func addViews() {
//        addSubview(mainStackView)

        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(textField)

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
