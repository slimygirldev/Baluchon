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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? ConversionTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .purple
        return cell
    }

}
