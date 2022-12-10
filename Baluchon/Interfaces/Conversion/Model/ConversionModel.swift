//
//  ConversionModel.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import Foundation

enum Currencies: String {
    case EUR = "EUR"
    case USD = "USD"
}

struct ConversionModel {
    var from: String
    var to: String
    var amount: Float
    var result: Float
}

struct FormModel {
    var from: String
    var to: String
    var amount: Float
}
