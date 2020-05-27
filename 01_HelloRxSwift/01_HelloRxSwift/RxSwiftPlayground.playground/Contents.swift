import UIKit
import RxSwift
import RxCocoa

//MARK: - BehaviorRelay. import RxCocoa
let disposeBag = DisposeBag()
let relay = BehaviorRelay(value: ["Item 1"])

var value = relay.value
value.append("Item 3")
value.append("Item 3")

relay.accept(value)

relay.asObservable()
    .subscribe {
        print($0)
}


//MARK: - Variables. Depricated
/*
let disposeBag = DisposeBag()
let variable = Variable([String]())
variable.value.append("Item 1")
variable.asObservable()
    .subscribe{
        print($0)
}
variable.value.append("Item 2")
*/


//MARK: - Replay Subject
/*
let disposeBag = DisposeBag()
let subject = ReplaySubject<String>.create(bufferSize: 2)
subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")
subject.subscribe {
    print($0)
}

subject.onNext("Issue 4")
subject.onNext("Issue 5")
subject.onNext("Issue 6")

subject.subscribe {
    print($0)
}
*/


//MARK: - Behavior Subject
/*
let disposeBag = DisposeBag()
let subject = BehaviorSubject(value: "Initial value")
subject.onNext("Last Issue")
subject.subscribe { event in
    print(event)
}
subject.onNext("Issue 1")
*/


//MARK: - Publish Subject
/*
let disposeBag = DisposeBag()
let subject = PublishSubject<String>()
subject.onNext("Issue 1")
subject.subscribe { event in
    print(event)
}
subject.onNext("Issue 2")
subject.onNext("Issue 3")
subject.dispose()
subject.onCompleted()
subject.onNext("Issue 4")
*/


//MARK: - Dispose
/*
let disposeBag = DisposeBag()
//Правильный способ отменять подписки
Observable.of("A","B","C")
    .subscribe {
        print($0)
}.disposed(by: disposeBag)

Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}.subscribe(onNext: {print($0)},
            onError: {print($0)},
            onCompleted: {print("Completed")},
            onDisposed: {print("Disposed")})
*/


//MARK: - Observable
/*
//just - 1 элемент
let observable = Observable.just(1)
//of - набор отдельных элементов
let observable2 = Observable.of(1,2,3)
//of - целый массив
let observable3 = Observable.of([1,2,3])
//from - каждый элемент массив по отдельности
let observable4 = Observable.from([1,2,3])

//Подписка. Элементы
observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

//Подписка. Целый array
observable3.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

//Подписка. Быстрый доступ к элементам onNext
let subscription4 = observable4.subscribe(onNext: { element in
    print(element)
})

//Прохой способ отменить подписку
subscription4.dispose()
*/
