//
//  Store.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Delta

struct Store: StoreType {
    var state: ObservableProperty<State>
    
    init(state: State) {
        self.state = ObservableProperty(state)
    }
}

var store = Store(state: State())
