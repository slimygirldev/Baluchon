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
        let textResult = UILabel()
        textResult.text = "00"
        textResult.font = .systemFont(ofSize: 40)
        textResult.translatesAutoresizingMaskIntoConstraints = false
        return textResult
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
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(textResult)

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func configure(result: String) {
        textResult.text = result
    }
}
