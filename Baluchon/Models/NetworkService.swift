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

protocol NetworkProtocol {
    var networkClient: URLSession { get set }
    func request<JSONType>(for queryURL: String,
                           entityType: JSONType.Type,
                           _ completionHandler: @escaping ((JSONType?, Error?) -> Void)) where JSONType: Decodable
    func request<JSONType>(for queryURL: URLRequest,
                           entityType: JSONType.Type,
                           _ completionHandler: @escaping ((JSONType?, Error?) -> Void)) where JSONType: Decodable

}

//class NetworkService {
extension NetworkProtocol {
// for request without header
    func request<JSONType: Decodable>(for queryURL: String,
                                      entityType: JSONType.Type,
                                      _ completionHandler: @escaping ((JSONType?, Error?) -> Void)) {
        if let url = URL(string: queryURL) {
            networkClient.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("Error occured, \(error.debugDescription)")
                    completionHandler(nil, error)
                    return
                }
                
                if let data = data {
                    // transform the data into EntityType
                    let entity = try? JSONDecoder().decode(entityType, from: data)
                    completionHandler(entity, nil)
                }
            }.resume()
        }
    }
// for request with header
    func request<JSONType>(for queryURL: URLRequest,
                           entityType: JSONType.Type,
                           _ completionHandler: @escaping ((JSONType?, Error?) -> Void)) where JSONType: Decodable {

        networkClient.dataTask(with: queryURL) { (data, response, error) in
            guard error == nil else {
                print("Error occured, \(error.debugDescription)")
                completionHandler(nil, error)
                return
            }
            if let data = data {
                do {
                    let entity = try JSONDecoder().decode(entityType, from: data)
                    print("data dans NS \(String(describing: entity))")
                    completionHandler(entity, nil)
                }
                catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
