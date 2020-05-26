//
//  ViewController.swift
//  01_HelloRxSwift
//
//  Created by Михаил Дмитриев on 26.05.2020.
//  Copyright © 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Observable.from([1, 2, 3, 4, 5])
    }


}

