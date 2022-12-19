//
//  TranslationTableView.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/12/2022.
//

import UIKit

protocol TranslationTableViewDelegate: AnyObject {
    func translationTableViewDelegateTappedConvertButton(model: TranslationFormModel)
}

enum LanguagesTitles: String {
    case fr = "Français"
    case en = "English"
}

class TranslationTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    weak var translationDelegate: TranslationTableViewDelegate?

    var formModel: TranslationFormModel = TranslationFormModel(from: Languages.fr.rawValue,
                                                               to: Languages.en.rawValue,
                                                               text: "Bonjour")
    var model: TranslationModel?

    var translatedText: String = ""

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        delegate = self
        dataSource = self

        self.register(TranslationLangagesTableViewCell.self,
                      forCellReuseIdentifier: TranslationLangagesTableViewCell.reuseIdentifier)
        self.register(TranslationButtonTableViewCell.self,
                      forCellReuseIdentifier: TranslationButtonTableViewCell.reuseIdentifier)
        self.register(TranslationTextToTranslateTableViewCell.self,
                      forCellReuseIdentifier: TranslationTextToTranslateTableViewCell.reuseIdentifier)
        self.register(TranslationTextTranslatedCell.self,
                      forCellReuseIdentifier: TranslationTextTranslatedCell.reuseIdentifier)

        self.separatorInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        self.endEditing(true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func switchLanguages() {
        let from = formModel.from
        formModel.from = formModel.to
        formModel.to = from
        reloadData()

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 || indexPath.section == 3 && indexPath.row == 0{
            return 150
        }
        return 44.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 || indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TranslationLangagesTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? TranslationLangagesTableViewCell else { return UITableViewCell() }
            cell.isUserInteractionEnabled = false
            if indexPath.row == 0 {
                cell.configure(title: "from: ", langage: formModel.from)
            } else {
                cell.configure(title: "to: ", langage: formModel.to)
            }
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TranslationTextToTranslateTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? TranslationTextToTranslateTableViewCell else { return UITableViewCell()}
            cell.isUserInteractionEnabled = true
            return cell
        } else if indexPath.section == 2 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TranslationButtonTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? TranslationButtonTableViewCell else { return UITableViewCell()}
            cell.isUserInteractionEnabled = true
            return cell
        } else if indexPath.section == 3 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TranslationTextTranslatedCell.reuseIdentifier,
                                                           for: indexPath) as? TranslationTextTranslatedCell else { return UITableViewCell()}
            cell.passText(translatedText: translatedText)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TranslationLangagesTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? TranslationLangagesTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Languages"
        } else if section == 1 {
            return "To translate :"
        } else if section == 3 {
            return "Translated text :"
        }
        return ""
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? TranslationTextToTranslateTableViewCell else {
            return
        }
        formModel.text = cell.textField.text
        if indexPath.section == 2 && indexPath.row == 0 {
            translationDelegate?.translationTableViewDelegateTappedConvertButton(model: formModel)
        }
    }
}

