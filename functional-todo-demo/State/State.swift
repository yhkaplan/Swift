//
//  State.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import ReactiveSwift

private let initialTodos: [Todo] = []

struct State {
    let todos = MutableProperty(initialTodos)
    let filter = MutableProperty(TodoFilter.all)
    let notSynced = MutableProperty(TodoFilter.notSyncedWithBackend)
    let selectedTodoItem = MutableProperty(TodoFilter.selected)
}
