import UIKit
import RxSwift
import RxCocoa

//MARK: - Scan

let disposeBag = DisposeBag()
let source = Observable.of(1,2,3,5,6)
source.scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
source.scan(0, accumulator: { summary, newValue in
    return summary + newValue
})
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


//MARK: - Reduce
/*
let disposeBag = DisposeBag()
let source = Observable.of(1,2,3)
source.reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
source.reduce(0, accumulator: { summary, newValue in
    return summary + newValue
})
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
*/

//MARK: - Latest From
/*
let disposeBag = DisposeBag()
let button = PublishSubject<Void>()
let textField = PublishSubject<String>()
let observable = button.withLatestFrom(textField)
let disposable = observable.subscribe(onNext: {
    print($0)
})
textField.onNext("Sw")
textField.onNext("Swif")
textField.onNext("Swift")
textField.onNext("Swift Best")
button.onNext(())
button.onNext(())
*/

//MARK: - Combine Latest
/*
let disposeBag = DisposeBag()
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()
let observable = Observable.combineLatest(left, right, resultSelector: { lastLeft, lastRight in
    "\(lastLeft) \(lastRight)"
})
let disposable = observable.subscribe(onNext: { value in
    print(value)
})
left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(99)
right.onNext(2)
*/

//MARK: - Merge
/*
let disposeBag = DisposeBag()
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()
let source = Observable.of(left.asObservable(),right.asObservable())
let observable = source.merge()
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
left.onNext(5)
left.onNext(3)
right.onNext(2)
right.onNext(1)
left.onNext(99)
*/

//MARK: - Concat
/*
let disposeBag = DisposeBag()
let first = Observable.of(1,2,3)
let second = Observable.of(4,5,6)
let observable = Observable.concat([first,second])
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
*/

//MARK: - StartsWith
/*
let disposeBag = DisposeBag()
let numbers = Observable.of(3,4,5,6)
let observable = numbers.startWith(1)
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
*/
