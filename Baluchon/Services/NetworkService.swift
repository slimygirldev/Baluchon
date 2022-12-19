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
// for request without header
    func request<JSONType>(for queryURL: String,
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
// for request with header
    func request<JSONType>(for queryURL: URLRequest,
                           entityType: JSONType.Type,
                           _ completionHandler: @escaping ((JSONType?, Error?) -> Void)) where JSONType: Decodable {

        URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            guard error == nil else {
                print("Error occured, \(error.debugDescription)")
                completionHandler(nil, error)
                return
            }
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(entityType, from: data)
                    print("data dans NS \(String(describing: json))")
                    completionHandler(json, nil)
                }
                catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
