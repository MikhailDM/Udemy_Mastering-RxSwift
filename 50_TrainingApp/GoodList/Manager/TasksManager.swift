//
//  TasksManager.swift
//  GoodList
//
//  Created by Михаил Дмитриев on 28.05.2020.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TasksManager {
//MARK: - PROPERTIES
    //Мусорка
    let disposeBag = DisposeBag()
    
    //Хранение массива
    var tasks = BehaviorRelay<[String]>(value: ["1 Task", "2 Task", "3 Task"])
    
    //Массив задач для отображения
    var tasksToPresent = [String]()
    
    //Subject который может как отправлять уведомления подписчикам, так и сам быть наблюдателем
    let taskManagerSubject = PublishSubject<String>()
    //Property
    var taskManagerSubjectObservable: Observable<String> {
        return taskManagerSubject.asObservable()
    }
    
    
//MARK: - INIT
    init() {
        //Массив задач для отображения
        //var tasksToPresent = tasks.value
    }

    
//MARK: - SUBSCRIBE
    func subscribe() {
        taskManagerSubjectObservable
            .subscribe(onNext: { [unowned self] task in
                //Массив задач
                var existingTasks = self.tasks.value
                //Массив задач с новой задачей
                existingTasks.append(task)
                //обновляем отслеживаемый массив
                self.tasks.accept(existingTasks)
                //tasks.append($0)
                self.tasksToPresent = self.tasks.value
                //self.tableView.reloadData()
            }).disposed(by: disposeBag)
    }
}

