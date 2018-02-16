//
//  RequestProtocol.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/16.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    subscript(key: String) -> (String?, String?) { get }
}

extension RequestProtocol {
    func getPropertyNames() -> [String] {
        return Mirror(reflecting: self)
            .children
            .filter { $0.label != nil }
            .map{ $0.label! }
    }
}
