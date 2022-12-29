//
//  ConversionEntity.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 04/12/2022.
//

import Foundation

struct ConversionEntity: Decodable {
    var query: Query
    struct Query: Decodable {
        var from: String
        var to: String
        var amount: Float
    }

    var result: Float
}
