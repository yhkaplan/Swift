//
//  ViewModel1.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/16.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import ReactiveCocoa

struct TodosViewModel {
    let todos: [Todo]
    
    func todoForIndexPath(_ indexPath: IndexPath) -> Todo {
        return todos[indexPath.row]
    }
}
