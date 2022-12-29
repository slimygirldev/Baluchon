//
// ConversionNetworkService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 04/12/2022.
//

import Foundation

class ConversionNetworkService: NetworkProtocol {
    var networkClient: URLSession
    private let apiKey: String = ""
    private let currencyURL: String = "https://api.apilayer.com/fixer/"

    init(networkClient: URLSession = .shared) {
        self.networkClient = networkClient
    }

    func fetchCurrency(from: String,
                       amount: Float,
                       to: String,
                       completion: @escaping ((ConversionModel?, Error?) -> Void)) {

        let url = "\(currencyURL)convert?to=\(to)&from=\(from)&amount=\(amount)"

        if let unwrapped = URL(string: url) {
            var request = URLRequest(url: unwrapped, timeoutInterval: Double.infinity)
            request.httpMethod = "GET"
            request.addValue(apiKey, forHTTPHeaderField: "apikey")

            self.request(for: request, entityType: ConversionEntity.self) {
                data, error  in
                guard error == nil else {
                    print("Error : \(error.debugDescription)")
                    completion(nil, error)
                    return
                }
                guard let entity = data else {
                    return
                }
                let conversionModel = ConversionModel(from: entity.query.from,
                                                      to: entity.query.to,
                                                      amount: entity.query.amount,
                                                      result: entity.result)

                completion(conversionModel, nil)
            }
        } else {
            print("error")
        }
    }
}
