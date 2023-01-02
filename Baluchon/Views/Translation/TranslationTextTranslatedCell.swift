//
//  TranslationTextTranslatedCell.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/12/2022.
//

import UIKit

class TranslationTextTranslatedCell: UITableViewCell {
    static let reuseIdentifier = "TranslationTextTranslatedCell"

    let textField: UITextView = {
        let textField = UITextView()
        textField.font = .systemFont(ofSize: 20)
        textField.isEditable = false
        textField.textAlignment = .left
        textField.keyboardType = .default
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

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10,
                                                                     bottom: 10, right: 10))
    }

    func getTextValue(text: String) {
        textField.text = text
    }

    private func addViews() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(textField)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    func passText(translatedText: String) {
        textField.text = translatedText
    }
}

