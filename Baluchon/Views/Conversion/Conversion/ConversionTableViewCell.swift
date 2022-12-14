//
//  ConversionTableViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 04/12/2022.
//

import UIKit

class ConversionTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ConversionTableViewCell"

    let textField: UITextField = {
        let textField = UITextField()
        textField.text = "0.0"
        textField.font = .systemFont(ofSize: 20)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .lightGray
        titleLabel.text = "Enter a value :"
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

    private func addViews() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(textField)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant : 20),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.widthAnchor.constraint(equalToConstant: 125)
        ])
    }
}
