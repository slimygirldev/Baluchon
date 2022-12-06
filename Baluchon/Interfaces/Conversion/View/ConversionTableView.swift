//
//  ConversionTableView.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 04/12/2022.
//

import UIKit

class ConversionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var model: ConversionModel?

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        delegate = self
        dataSource = self

        self.register(ConversionTableViewCell.self,
                      forCellReuseIdentifier: ConversionTableViewCell.reuseIdentifier)

        self.separatorInset = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 3
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 {
            return 70.0
        }
        return 44.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ConversionTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .white

        if indexPath.section == 1 && indexPath.row == 0 {
            cell.backgroundColor = .gray
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Convert a currency"
        } else {
            return "Conversion"
        }
    }
}
