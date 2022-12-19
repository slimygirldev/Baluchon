//
//  TranslationEntity.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 16/12/2022.
//

import Foundation

struct TranslationEntity: Decodable {
    let data: Data

    struct Data: Decodable {
        let translations: [Translation]
    }

    struct Translation: Decodable {
        let translatedText: String
    }
}
