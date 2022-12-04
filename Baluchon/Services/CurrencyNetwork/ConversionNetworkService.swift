//
// ConversionNetworkService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 04/12/2022.
//

import Foundation

class ConversionNetworkService {

    private let apiKey: String = ""
    private let currencyURL: String = "https://api.apilayer.com/fixer/"
    private let networkService: NetworkService = NetworkService()

    func fetchCurrency(from: String,
                       amount: Float,
                       to: String,
                       completion: @escaping ((ConversionModel?, Error?) -> Void)) {

        let url = "\(currencyURL)convert?to=\(to)&from=\(from)&amount=\(amount)"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")

        networkService.request(for: request, entityType: ConversionEntity.self) {
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
    }
}
