//
//  AlertProvider.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 02/12/2022.
//

import Foundation
import UIKit

enum AlertMessage: String {
    case unableToFetchApiressource = "Network Error."
}

class AlertProvider: Error {

    func alertError(alertType: NetworkError) -> UIAlertController {
        switch alertType {
        case .fetchError:
            let alertVC = UIAlertController(title: "Erreur",
                                            message: AlertMessage.unableToFetchApiressource.rawValue,
                                            preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return alertVC
        }
    }
}
