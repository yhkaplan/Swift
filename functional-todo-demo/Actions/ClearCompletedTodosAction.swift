//
//  ClearCompletedTodosAction.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Delta

//TODO: What's the difference between ActionType and DynamicActionType?
//Mutability?
struct ClearCompletedTodosAction: DynamicActionType {
    func call() {
        let todos = store.completedTodos.first()?.value ?? []
        
        todos.forEach { todo in
            store.dispatch(DeleteTodoAction(todo: todo))
        }
    }
}
