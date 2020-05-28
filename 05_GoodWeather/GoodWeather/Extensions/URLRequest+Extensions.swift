//
//  URLRequest+Extensions.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 3/9/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

//Модель нашего URL
struct Resource<T> {
    let url: URL
}
//Запрос
extension URLRequest {
    //Функция запроса с нашим URL. Возвращает Observable
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.from([resource.url])
            //flatMap дает доступ к URL
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            //map - перебор
            }.map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
        
    }
    
}
