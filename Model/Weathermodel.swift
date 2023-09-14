//
//  Weathermodel.swift
//  WeatherApp
//
//  Created by Pelin Üstünel on 15.09.2023.
//

import Foundation

struct WeatherModel: Decodable {
    
    let coord: CoordinatesResponse
    let weather: [WeatherResponse]
    let main: MainResponse
    let name: String
    let wind: WindResponse

    struct CoordinatesResponse: Decodable {
        let lon: Double
        let lat: Double
    }

    struct WeatherResponse: Decodable {
        let id: Double
        let main: String
        let description: String
        let icon: String
    }

    struct MainResponse: Decodable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct WindResponse: Decodable {
        let speed: Double
        let deg: Double
    }
}

extension WeatherModel.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
