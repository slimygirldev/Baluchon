//
//  TranslationModel.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 14/11/2022.
//

import Foundation

enum Languages: String {
    case fr = "fr"
    case en = "en"
}

struct TranslationModel {
    var source: String
    var target: String
    var translatedText: String
}

struct TranslationFormModel {
    var from: String
    var to: String
    var text: String
}
