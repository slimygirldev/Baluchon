//
//  ConversionTableView.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 04/12/2022.
//

import UIKit

protocol ConversionTableViewDelegate: AnyObject {
    func conversionTableViewDelegateTappedConvertButton(model: FormModel)
}

class ConversionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    weak var conversionDelegate: ConversionTableViewDelegate?

    var formModel: FormModel = FormModel(from: Currencies.EUR.rawValue,
                                          to: Currencies.USD.rawValue,
                                          amount: 0.0)

    var model: ConversionModel?

    var result: Float = 0.0

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        delegate = self
        dataSource = self

        self.register(ConversionTableViewCell.self,
                      forCellReuseIdentifier: ConversionTableViewCell.reuseIdentifier)
        self.register(ConversionCurrencyTableViewCell.self,
                      forCellReuseIdentifier: ConversionCurrencyTableViewCell.reuseIdentifier)
        self.register(ConversionValueTableViewCell.self,
                      forCellReuseIdentifier: ConversionValueTableViewCell.reuseIdentifier)
        self.register(ConversionButtonTableViewCell.self,
                      forCellReuseIdentifier: ConversionButtonTableViewCell.reuseIdentifier)
        self.register(ConversionResultTableViewCell.self,
                      forCellReuseIdentifier: ConversionResultTableViewCell.reuseIdentifier)

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
        if indexPath.section == 3 && indexPath.row == 0 || indexPath.section == 1 && indexPath.row == 0{
            return 70.0
        }
        return 44.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 || indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionCurrencyTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ConversionCurrencyTableViewCell else { return UITableViewCell() }
            cell.isUserInteractionEnabled = false
            if indexPath.row == 0 {
                cell.configure(title: "from :", currency: .EUR)
            } else {
                cell.configure(title: "to :", currency: .USD)
            }
            return cell
        } else if indexPath.section == 1 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionValueTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ConversionValueTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 2 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionButtonTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ConversionButtonTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 3 && indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionResultTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ConversionResultTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            print(result.clean)
            cell.configure(result: "\(result.clean)")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionTableViewCell.reuseIdentifier,
                                                           for: indexPath) as? ConversionTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Currencies"
        } else if section == 1 {
            return "Enter a value"
        } else if section == 3 {
            return "Result of conversion"
        } else {
            return ""
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? ConversionValueTableViewCell else {
            return
        }
        formModel.amount = Float(cell.textField.text ?? "") ?? 0.0

        if indexPath.section == 2 && indexPath.row == 0 {
            conversionDelegate?.conversionTableViewDelegateTappedConvertButton(model: formModel)
        }
    }
}
