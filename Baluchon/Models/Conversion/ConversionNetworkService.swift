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
//    private let networkService: NetworkService = NetworkService()

    init(networkClient: URLSession = .shared) {
        self.networkClient = networkClient
    }

    func fetchCurrency(from: String,
                       amount: Float,
                       to: String,
                       completion: @escaping ((ConversionModel?, Error?) -> Void)) {

        let url = "\(currencyURL)convert?to=\(to)&from=\(from)&amount=\(amount)"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
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
            // ici on a reçu l'entité du serveur et on céée notre model a partir de la data
            let conversionModel = ConversionModel(from: entity.query.from,
                                                  to: entity.query.to,
                                                  amount: entity.query.amount,
                                                  result: entity.result)
            // et on renvoit le model
            // le network ne connait pas le model mais l'entité
            // et le VC ne connait que le model : ce qui permet d'assurer un découplage entre le reseau et le corps de l'app
            completion(conversionModel, nil)
        }
    }
}
