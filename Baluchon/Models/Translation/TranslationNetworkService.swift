//
//  TranslationNetworkService.swift
//  Baluchon
//
//  Created by Lorene Brocourt on 16/12/2022.
//
import Foundation


class TranslationNetworkService {

    private let apiKey: String = ""
    private let translationURL: String = "https://translation.googleapis.com/language/translate/v2"
    private let networkService: NetworkService = NetworkService()

    func fetchTranslationwithComponents(source: String,
                                        target: String,
                                        textToTranslate: String,
                                        completion: @escaping ((TranslationModel?, Error?) -> Void)) {

        if let url = URLComponents(string: "\(translationURL)/?q=\(textToTranslate)&source=\(source)&target=\(target)&format=text&key=\(apiKey)")?.url {
            print(url)
            var request = URLRequest(url: url,timeoutInterval: Double.infinity)

            request.httpMethod = "GET"
            request.addValue(apiKey, forHTTPHeaderField: "apikey")

            networkService.request(for: request, entityType: TranslationEntity.self) {
                entity, error  in
                guard error == nil else {
                    print("Error : \(error.debugDescription)")
                    completion(nil, error)
                    return
                }
                guard let entity = entity else {
                    completion(nil, error)
                    print("data dans TNS \(String(describing: entity))")
                    return
                }
                let translationModel = TranslationModel(source: source,
                                                        target: target,
                                                        translatedText: entity.data.translations.first?.translatedText ?? "")
                print(translationModel)
                completion(translationModel, nil)
            }
        } else {
            print("error")
        }
    }
}
