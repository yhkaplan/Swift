//
//  Todo.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/16.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

enum TodoFilter: Int {
    case all
    case active
    case completed
    case notSyncedWithBackend
    case selected
}

struct Todo {
    let todoId: Int
    let name: String
    let description: String
    let notes: String?
    let completed: Bool
    let synced: Bool
    let selected: Bool?
}

extension Todo: Argo.Decodable {
    static func decode(_ json: JSON) -> Decoded<Todo> {
        return curry(Todo.init)
            <^> json <| "todoId"
            <*> json <| "name"
            <*> json <| "description"
            <*> json <|? "notes"
            <*> json <| "completed"
            <*> json <| "synced"
            <*> json <|? "selected"
    }
}

extension Todo: Equatable {
    static func ==(lhs: Todo, rhs: Todo) -> Bool {
        return lhs.todoId == rhs.todoId
    }
}
