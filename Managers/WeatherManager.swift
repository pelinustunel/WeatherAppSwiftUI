//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Pelin Üstünel on 13.09.2023.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel{
        let apiKey = "526657220047cb2704bc677a7a895bce"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric") else{
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            fatalError("Error fetching weather data")
        }
                
        let decodeData = try JSONDecoder().decode(WeatherModel.self, from: data)
        return decodeData
    }
    
}

