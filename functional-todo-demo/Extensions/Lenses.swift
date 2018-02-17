//
//  Lenses.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation

struct Lens<Whole, Part> {
    let get: (Whole) -> Part
    let set: (Part, Whole) -> Whole
}

let todoNameLens: Lens<Todo, String> = Lens(
    get: { $0.name},
    set: {
        Todo(todoId: $1.todoId,
             name: $0,
             description: $1.description,
             notes: $1.notes,
             completed: $1.completed,
             synced: $1.synced,
             selected: $1.selected)
})

let todoDescriptionLens: Lens<Todo, String> = Lens(
    get: { $0.description },
    set: {
        Todo(todoId: $1.todoId,
             name: $1.name,
             description: $0,
             notes: $1.notes,
             completed: $1.completed,
             synced: $1.synced,
             selected: $1.selected)
})

let todoNotesLens: Lens<Todo, String> = Lens(
    get: { $0.notes! },
    set: {
        Todo(todoId: $1.todoId,
             name: $1.name,
             description: $1.description,
             notes: $0,
             completed: $1.completed,
             synced: $1.synced,
             selected: $1.selected)
})

let todoCompletedLens: Lens<Todo, Bool> = Lens(
    get: { $0.completed },
    set: {
        Todo(todoId: $1.todoId,
             name: $1.name,
             description: $1.description,
             notes: $1.notes,
             completed: $0,
             synced: $1.synced,
             selected: $1.selected)
})

let todoSyncedLens: Lens<Todo, Bool> = Lens(
    get: { $0.synced },
    set: {
        Todo(todoId: $1.todoId,
             name: $1.name,
             description: $1.description,
             notes: $1.notes,
             completed: $1.completed,
             synced: $0,
             selected: $1.selected)
})
