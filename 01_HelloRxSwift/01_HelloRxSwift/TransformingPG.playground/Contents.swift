import UIKit
import RxSwift
import RxCocoa

//MARK: - Flat Map Latest

let disposeBag = DisposeBag()
struct Student {
    var score: BehaviorRelay<Int>
}
let john = Student(score: BehaviorRelay<Int>(value: 75))
let mary = Student(score: BehaviorRelay<Int>(value: 95))
let student = PublishSubject<Student>()
student.asObservable()
    .flatMapLatest { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)
john.score.accept(100)
student.onNext(mary)
john.score.accept(45)


//MARK: - Flat Map
/*
let disposeBag = DisposeBag()
struct Student {
    var score: BehaviorRelay<Int>
}
let john = Student(score: BehaviorRelay<Int>(value: 75))
let mary = Student(score: BehaviorRelay<Int>(value: 95))

let student = PublishSubject<Student>()
student.asObservable()
    .flatMap { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
student.onNext(john)
john.score.accept(100)
student.onNext(mary)
mary.score.accept(90)
john.score.accept(43)
*/

//MARK: - Map
/*
let disposeBag = DisposeBag()
Observable.of(1,2,3,4,5,6)
    .map() { $0 * 2 }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
*/

//MARK: - ToArray
/*
let disposeBag = DisposeBag()
Observable.of(1,2,3,4,5,6)
    .toArray()
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
*/

