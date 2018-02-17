//
//  DetailsTodoAction.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Delta

struct DetailsTodoAction: ActionType {
    let todo: Todo
    
    func reduce(state: State) -> State {
        state.todos.value = state.todos.value.map { todo in
            
            guard todo == self.todo else {
                return Todo(todoId: todo.todoId,
                            name: todo.name,
                            description: todo.description,
                            notes: todo.notes,
                            completed: todo.completed,
                            synced: todo.synced,
                            selected: false)
            }
            
            return Todo(todoId: self.todo.todoId,
                        name: self.todo.name,
                        description: self.todo.description,
                        notes: self.todo.notes,
                        completed: self.todo.completed,
                        synced: self.todo.synced,
                        selected: true)
        }
        return state
    }
}
