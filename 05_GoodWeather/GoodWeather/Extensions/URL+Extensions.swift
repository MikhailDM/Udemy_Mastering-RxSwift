//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 3/9/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    //Уникальный URL для города
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=7d2dd8c9c5578b741c7735ad3f0d39ea&units=imperial")
    }
    
}
