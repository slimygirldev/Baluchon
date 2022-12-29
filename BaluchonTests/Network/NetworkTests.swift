//
//  WeatherTests.swift
//  BaluchonTests
//
//  Created by Soomin Lee on 26/12/2022.
//

import XCTest
@testable import Baluchon

class NetworkTests: XCTestCase {
    // custom urlsession for mock network calls (networkClient)
    var dummyUrlSession: URLSession!

    override func setUpWithError() throws {
        // Set url session for mock networking
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        dummyUrlSession = URLSession(configuration: configuration)
    }

    private func loadData(from resource: String) throws -> Data {
        let bundle = Bundle(for: BaluchonTests.self)
        let url = bundle.url(forResource: resource, withExtension: "json")!
        return try Data(contentsOf: url)
    }

    private func loadJSON(from data: Data) throws -> [String: Any]? {
        return try JSONSerialization.jsonObject(with: data) as? [String: Any]
    }

    func testGivenMockUrlSession_WhenRequestForWeatherWithMockedJson_ThenWeatherModelCorrectlyCreated() throws {
        let weatherAPI = NetworkWeatherService(networkClient: dummyUrlSession)

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
            // We have a model, here we can test the values from the json
            XCTAssertEqual(model!.cityName, "Paris")
            XCTAssertEqual(model!.mainWeatherDescription, "broken clouds")
            XCTAssertEqual(model!.tempMax, 285.29)
            XCTAssertEqual(model!.tempMin, 283.8)
            XCTAssertEqual(model!.temp, 284.64)
            XCTAssertEqual(model!.humidity, 71)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testGivenMockUrlSession_WhenRequestForConversionWithMockedJson_ThenConversionModelCorrectlyCreated() throws {
        let conversionAPI = ConversionNetworkService(networkClient: dummyUrlSession)

        let mockData = try loadData(from: "Conversion")

        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }

        let expectation = XCTestExpectation(description: "response")

        conversionAPI.fetchCurrency(from: "EUR", amount: 1, to: "USD") { model, error in
            XCTAssertEqual(model!.from, "EUR")
            XCTAssertEqual(model!.to, "USD")
            XCTAssertEqual(model!.amount, 1)
            XCTAssertEqual(model!.result, 1.062846)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testGivenMockUrlSession_WhenRequestForTranslationWithMockedJson_ThenTranslationModelCorrectlyCreated() throws {
        let conversionAPI = TranslationNetworkService(networkClient: dummyUrlSession)

        let mockData = try loadData(from: "Translation")

        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }

        let expectation = XCTestExpectation(description: "response")

        conversionAPI.fetchTranslationwithComponents(source: "fr", target: "en", textToTranslate: "Bonjour, je suis heureux.") { model, error in
            XCTAssertEqual(model!.source, "fr")
            XCTAssertEqual(model!.target, "en")
            XCTAssertEqual(model!.translatedText, "Hello, I'm happy.")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
}
