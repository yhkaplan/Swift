//
//  MutableProperty+Delta.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Delta

extension MutableProperty: Delta.ObservablePropertyType {
    public typealias ValueType = Value
}
