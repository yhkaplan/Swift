//
//  CreateTodoAction.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Delta

struct CreateTodoAction: ActionType {
    let todoId: Int
    let name: String
    let description: String
    let notes: String
    
    var todo: Todo {
        return Todo(todoId: todoId,
                    name: name,
                    description: description,
                    notes: notes,
                    completed: false,
                    synced: false,
                    selected: false)
    }
    
    func reduce(state: State) -> State {
        state.todos.value = state.todos.value + [todo]
        
        return state
    }
}
