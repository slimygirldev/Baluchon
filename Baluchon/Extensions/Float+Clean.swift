//
//  Float+Clean.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 10/12/2022.
//

import Foundation

extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(self) : String(format: "%.2f", self)
    }
}
