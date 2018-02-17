//
//  TodoTableViewCell.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    var todo: Todo? {
        didSet {
            updateUI()
        }
    }
    
    var attributedText: NSAttributedString {
        guard let todo = todo else { return NSAttributedString() }
        
        let attributes: [NSAttributedStringKey: Any]
        if todo.completed {
            attributes = [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue as Any]
        } else {
            attributes = [:]
        }
        
        return NSAttributedString(string: todo.name, attributes: attributes)
    }
    
    func configure(_ todo: Todo) {
        store.producerForTodo(todo).startWithValues { nextTodo in
            self.todo = nextTodo
        }
    }
    
    func updateUI() {
        guard let todo = todo else { return }
        
        textLabel?.attributedText = attributedText
        accessoryType = todo.completed ? .checkmark : .none
    }
}
