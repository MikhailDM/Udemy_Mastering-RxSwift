//
//  Task.swift
//  GoodList
//
//  Created by Mohammad Azam on 2/27/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

//Модель задач
struct Task {
    var title: String
}

extension Task {
    //Возвращаем полный массив из заданных задач
    static public func getAllTasks() -> [Task] {
        return [
            Task(title: "First task"),
            Task(title: "Second task"),
            Task(title: "Third task"),
            Task(title: "A"),
            Task(title: "B"),
            Task(title: "Z"),
            Task(title: "W"),
            Task(title: "55"),
            Task(title: "3"),
        ]
    }
}
