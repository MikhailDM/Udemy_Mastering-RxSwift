//
//  Task.swift
//  GoodList
//
//  Created by Mohammad Azam on 2/27/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

//Типы приоритетов
enum Priority: Int {
    case high
    case medium
    case low 
}
//Модель задач
struct Task {
    let title: String
    let priority: Priority
}
