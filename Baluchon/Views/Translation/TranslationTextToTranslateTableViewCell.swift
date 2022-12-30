//
//  TranslationTextToTranslateTableViewCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/12/2022.
//

import UIKit

class TranslationTextToTranslateTableViewCell: UITableViewCell {

    static let reuseIdentifier = "TranslationTextToTranslateTableViewCell"

    let textField: UITextView = {
        let textField = UITextView()
        textField.font = .systemFont(ofSize: 20)
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.clearsOnInsertion = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemBlue
        addViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toto(text: String) {
        textField.text = text
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10,
                                                                     bottom: 10, right: 10))
    }

    private func addViews() {
        contentView.addSubview(mainStackView)

        mainStackView.addArrangedSubview(textField)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
