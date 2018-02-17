//
//  LoadTodosAction.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Delta

struct LoadTodosAction: ActionType {
    let todos: [Todo]
    
    func reduce(state: State) -> State {
        state.todos.value = state.todos.value + todos
        return state
    }
}
