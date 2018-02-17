//
//  SetFilterAction.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Delta

struct SetFilterAction: ActionType {
    let filter: TodoFilter
    
    func reduce(state: State) -> State {
        state.filter.value = filter
        return state
    }
}
