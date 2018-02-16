//
//  TodoRequest.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/16.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation

struct TodoRequest: RequestProtocol {
    let todoId: Int
    let name: String
    let description: String
    let notes: String
    let completed: Bool
    let synced: Bool
    
    subscript(key: String) -> (String?, String?) {
        get {
            switch key {
            case "todoId":
                return (String(todoId), "todoId")
            
            case "name":
                return (name, "name")
            
            case "description":
                return (description, "description")
            
            case "notes":
                return (notes, "notes")
            
            case "completed":
                return (String(completed), "completed")
            
            case "synced":
                return (String(synced), "synced")
            
            default:
                return ("Cookie", "test=123")
            }
        }
    }
}
