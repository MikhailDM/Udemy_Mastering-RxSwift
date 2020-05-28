//
//  TaskListViewController.swift
//  GoodList
//
//  Created by Mohammad Azam on 2/26/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    
//MARK: - TASKS
    
    
    
//MARK: - PROPERTIES
    //Мусорка
    let disposeBag = DisposeBag()
    
    //Хранение массива
    var tasks = BehaviorRelay<[String]>(value: ["1", "2", "3"])
    
    //Массив всех задач
    var tasksFilter = [String]()
    //var observable = Observable<[Task]>.of([
    /*//Массив всех задач
    //BehaviorRelay - RxCocoa. Отлично подходят для незавершающихся последовательностей
    private var tasks = BehaviorRelay<[Task]>(value: Task.getAllTasks())
    //Отфильтрованые задачи
    private var filteredTasks = [Task]()*/
    
    //Can emmit and subscribe
    private let taskSubject = PublishSubject<String>()
    //Property
    var taskSubjectObservable: Observable<String> {
        return taskSubject.asObservable()
    }

    
//MARK: - LYFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        //Подписываемся на Subject
        //Действия будут выполняться после обновления Subject
        taskSubjectObservable
            .subscribe(onNext: { [unowned self] task in
                //Массив задач
                var existingTasks = self.tasks.value
                //Массив задач с новой задачей
                existingTasks.append(task)
                //обновляем отслеживаемый массив
                self.tasks.accept(existingTasks)
                //tasks.append($0)
                self.tasksFilter = self.tasks.value
                self.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        tasksFilter = tasks.value
        
        //Публикуем событие при запуске
        taskSubject.onNext("10")
    }
    
    
//MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        //cell.textLabel?.text = self.filteredTasks[indexPath.row].title
        cell.textLabel?.text = self.tasksFilter[indexPath.row]
        return cell
    }
    
    
//MARK: - NAVIGATION
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Доступ к destination VC
        guard let navC = segue.destination as? UINavigationController,
            let addTVC = navC.viewControllers.first as? AddTaskViewController else {
                fatalError("Controller not found...")
        }
        //Подписываемся на Subject
        //Действия будут выполняться после обновления Subject
        addTVC.taskSubjectObservable
            .subscribe(onNext: { [unowned self] task in
                //Приоритет из SelectedControl
                let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex - 1)
                //Массив задач
                var existingTasks = self.tasks.value
                //Массив задач с новой задачей
                existingTasks.append(task)
                //Обновляем массив задач
                self.tasks.accept(existingTasks)
                //Фильтрация по Priority
                self.filterTasks(by: priority)
                
            }).disposed(by: disposeBag)
    }*/
    
    
//MARK: - ACTIONS
    @IBAction func sortAButtonPressed(_ sender: UIButton) {
        //Публикуем событие при запуске
        taskSubject.onNext("A")
    }
    
    @IBAction func sortZButtonPressed(_ sender: UIButton) {
        //Публикуем событие при запуске
        taskSubject.onNext("Z")
    }
    
    
    
    /*@IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
        //Выбор фильтрации череж SegmentedControl
        let priority = Priority(rawValue: segmentedControl.selectedSegmentIndex - 1)
        filterTasks(by: priority)
        
    }*/
    
    
//MARK: - PRIVATE
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    //Фильтрация элементов
    /*private func filterTasks(by priority: Priority?) {
        //Когда приоритет - All
        if priority == nil {
            self.filteredTasks = self.tasks.value
            self.updateTableView()
        } else {
            //Сортировка по приоритету
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == priority! }
                }.subscribe(onNext: { [weak self] tasks in
                    //Обновляем отфильтрованый массив
                    self?.filteredTasks = tasks
                    self?.updateTableView() 
                }).disposed(by: disposeBag)
            
        }
        
    }*/
    
}


/*
 //Can emmit and subscribe
 private let taskSubject = PublishSubject<Task>()
 //Property
 var taskSubjectObservable: Observable<Task> {
     return taskSubject.asObservable()
 }
 */
/*
 
 var relay = BehaviorRelay<[Task]>(value: [
     Task(title: "First task"),
     Task(title: "Second task"),
     Task(title: "Third task"),
     Task(title: "A"),
     Task(title: "B"),
     Task(title: "Z"),
     Task(title: "W"),
     Task(title: "55"),
     Task(title: "3"),
 ])
 */