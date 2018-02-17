//
//  TodoManager.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Alamofire
import Argo

func addTodo(_ completion: @escaping (_ responseData: [Todo]?, _ error: Error?) -> Void) {
    let newRequest = TodoRequest(todoId: 1, name: "Saturday", description: "Bananas", notes: "Expiration data", completed: false, synced: true)
    
    sendRequest(URLs.postTodo, request: newRequest) { response, error in
        guard error == nil, let response = response else {
            completion(nil, error)
            print("Request failed: \(error?.localizedDescription ?? "")")
            return
        }
        
        let todos: [Todo]? = decode(response)
        completion(todos, nil)
        print("Request was successful: \(todos!)")
    }
}

func listTodos(_ completion: @escaping (_ responseData: [Todo]?, _ error: Error?) -> Void) {
    sendRequest(URLs.getTodos, request: RequestModel()) { response, error in
        guard error == nil, let response = response else {
            completion(nil, error)
            print("Request failed: \(error?.localizedDescription ?? "")")
            return
        }
        
        let todos: [Todo]? = decode(response)
        completion(todos, nil)
        print("Request was successful: \(todos!)")
    }
}

func addOrUpdateTodo(_ todo: [Todo]?, completion: @escaping (_ responseData: [Todo]?, _ error: Error?) -> Void) {
    guard let todoItem = todo?.first else {
        completion(nil, nil)//TODO: Add error
        print("Request failed)")
        return
    }
    
    //TODO: Shouldn't the below exist as a convenience init???
    let newRequest = TodoRequest(todoId: todoItem.todoId, name: todoItem.name, description: todoItem.description, notes: todoItem.notes!, completed: todoItem.completed, synced: todoItem.synced)
    
    sendRequest(URLs.postTodo, request: newRequest) { response, error in
        guard error == nil, let response = response else {
            completion(nil, error)
            print("Request failed: \(error?.localizedDescription ?? "")")
            return
        }
        
        let todos: [Todo]? = decode(response)
        let newTodo = todoSyncedLens.set(true, todoItem)
        store.dispatch(UpdateTodoAction(todo: newTodo))
        completion(todos, nil)
        print("Request was successful: \(todos!)")
    }
}
