//
//  WeatherResult.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 3/7/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
//Данные JSON
struct WeatherResult: Decodable {
    let main: Weather
}
struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}

extension WeatherResult {
    
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
    
}

