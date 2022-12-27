//
//  WeatherTests.swift
//  BaluchonTests
//
//  Created by Soomin Lee on 26/12/2022.
//

import XCTest
@testable import Baluchon

class WeatherTests: XCTestCase {
    // custom urlsession for mock network calls
    var urlSession: URLSession!

    override func setUpWithError() throws {
        // Set url session for mock networking
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }

    private func loadData(from resource: String) throws -> Data {
        let bundle = Bundle(for: BaluchonTests.self)
        let url = bundle.url(forResource: resource, withExtension: "json")!
        return try Data(contentsOf: url)
    }

    private func loadJSON(from data: Data) throws -> [String: Any]? {
        return try JSONSerialization.jsonObject(with: data) as? [String: Any]
    }

    func test_getWeather() throws {
        let weatherAPI = NetworkWeatherService(networkClient: urlSession)

        // Set mock data
        let mockData = try loadData(from: "Weather")

        // Return data in mock request handler
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }

        // Set expectation. Used to test async code.
        let expectation = XCTestExpectation(description: "response")

        // Make mock network request to get profile

        weatherAPI.fetchWeather(for: .paris) { model, error in
            print(model)
            // We have a model, here we can test the values from the json
            // i.e: XCTAssertEqual(model.name, "Paris")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
