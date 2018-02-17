//
//  RequestModel.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation

struct RequestModel: RequestProtocol {
    subscript(key: String) -> (String?, String?) {
        get {
            switch key {
            default: return ("Cookie", "test=123")
            }
        }
    }
}
