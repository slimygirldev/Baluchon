//
//  TranslationView.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 13/12/2022.
//

import UIKit

class TranslationView: UIView {

    private let originLangageLabel: UILabel = {
        let originLangageLabel: UILabel = UILabel()
        originLangageLabel.text = "Français"
        originLangageLabel.textAlignment = .left
        originLangageLabel.textColor = .lightGray
        originLangageLabel.font = .systemFont(ofSize: 14)
        originLangageLabel.translatesAutoresizingMaskIntoConstraints = false
        return originLangageLabel
    }()

    private let destinationLangageLabel: UILabel = {
        let destinationLangageLabel: UILabel = UILabel()
        destinationLangageLabel.text = "Anglais"
        destinationLangageLabel.textAlignment = .left
        destinationLangageLabel.textColor = .lightGray
        destinationLangageLabel.font = .systemFont(ofSize: 14)
        destinationLangageLabel.translatesAutoresizingMaskIntoConstraints = false
        return destinationLangageLabel
    }()

    private let textToTranslate: UITextView = {
        let textToTranslate: UITextView = UITextView()
        textToTranslate.font = .systemFont(ofSize: 22)
        textToTranslate.isEditable = true
        textToTranslate.textAlignment = .left
        textToTranslate.keyboardType = .default
        textToTranslate.translatesAutoresizingMaskIntoConstraints = false
        return textToTranslate
    }()

    private let textTranslated: UITextView = {
        let textTranslated: UITextView = UITextView()
        textTranslated.font = .systemFont(ofSize: 22)
        textTranslated.textAlignment = .left
        textTranslated.isEditable = false
        textTranslated.isUserInteractionEnabled = false
        textTranslated.translatesAutoresizingMaskIntoConstraints = false
        return textTranslated
    }()

    private lazy var translateButton: UIButton = {
        let translateButton: UIButton = UIButton()
        translateButton.backgroundColor = .systemBlue
        translateButton.setTitle("Translate", for: .normal)
        translateButton.setTitleColor(.white, for: .normal)
        translateButton.layer.cornerRadius = 5
        translateButton.addTarget(self, action: #selector(pressedTranslate), for: .touchUpInside)
        return translateButton
    }()

    private let mainStackView: UIStackView = {
        let mainStackView: UIStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 10
        mainStackView.backgroundColor = .green
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()

    private let originLangageStackView: UIStackView = {
        let originLangageStackView: UIStackView = UIStackView()
        originLangageStackView.axis = .vertical
        originLangageStackView.alignment = .leading
        originLangageStackView.backgroundColor = .red
        originLangageStackView.translatesAutoresizingMaskIntoConstraints = false
        return originLangageStackView
    }()

    private let destinationLangageStackView: UIStackView = {
        let destinationLangageStackView: UIStackView = UIStackView()
        destinationLangageStackView.axis = .vertical
        destinationLangageStackView.distribution = .fill
        destinationLangageStackView.backgroundColor = .cyan
        destinationLangageStackView.translatesAutoresizingMaskIntoConstraints = false
        return destinationLangageStackView
    }()

    private let headerOriginLangageStackView: UIStackView = {
        let headerOriginLangageStackView: UIStackView = UIStackView()
        headerOriginLangageStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        headerOriginLangageStackView.isLayoutMarginsRelativeArrangement = true
        headerOriginLangageStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerOriginLangageStackView
    }()

    private let headerDestinationLangageStackView: UIStackView = {
        let headerDestinationLangageStackView: UIStackView = UIStackView()
        headerDestinationLangageStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        headerDestinationLangageStackView.isLayoutMarginsRelativeArrangement = true
        headerDestinationLangageStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerDestinationLangageStackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setUpConstraints()
        setUpViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(originLangageStackView)
        mainStackView.addArrangedSubview(translateButton)
        mainStackView.addArrangedSubview(destinationLangageStackView)

        headerOriginLangageStackView.addArrangedSubview(originLangageLabel)
        originLangageStackView.addArrangedSubview(headerOriginLangageStackView)
        originLangageStackView.addArrangedSubview(textToTranslate)

        headerDestinationLangageStackView.addArrangedSubview(destinationLangageLabel)
        destinationLangageStackView.addArrangedSubview(headerDestinationLangageStackView)
        destinationLangageStackView.addArrangedSubview(textTranslated)
    }

    private func setUpViewConstraints() {
        NSLayoutConstraint.activate([
            headerOriginLangageStackView.heightAnchor.constraint(equalToConstant: 40),
            headerOriginLangageStackView.widthAnchor.constraint(equalTo: originLangageStackView.widthAnchor),

            textToTranslate.widthAnchor.constraint(equalTo: originLangageStackView.widthAnchor),

            translateButton.heightAnchor.constraint(equalToConstant: 44),
            translateButton.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),

            headerDestinationLangageStackView.heightAnchor.constraint(equalToConstant: 40),
            headerDestinationLangageStackView.widthAnchor.constraint(equalTo: destinationLangageStackView.widthAnchor),

            textTranslated.widthAnchor.constraint(equalTo: destinationLangageStackView.widthAnchor),
        ])
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65)
        ])
    }

    @objc func pressedTranslate() {
        print("translate btn pressed")
    }
}
