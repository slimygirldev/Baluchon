//
//  NetworkService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 02/12/2022.
//

import Foundation

enum NetworkError: Error {
    case fetchError
}

class NetworkService {

    func request<JSONType>(for queryURL: String,
                           //ici on précise qu'on veut le Type de JSONType et non une entité de ce 'type'
                           entityType: JSONType.Type,
                           _ completionHandler: @escaping ((JSONType?, Error?) -> Void)) where JSONType: Decodable {
        if let url = URL(string: queryURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("Error occured, \(error.debugDescription)")
                    completionHandler(nil, error)
                    return
                }
                
                if let data = data {
                    let json = try? JSONDecoder().decode(entityType, from: data)
                    completionHandler(json, nil)
                }
            }.resume()
        }
    }
}
