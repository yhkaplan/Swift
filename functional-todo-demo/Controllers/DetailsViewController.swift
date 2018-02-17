//
//  DetailsViewController.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    var viewModel = TodoViewModel(todo: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        store.selectedTodo.startWithValues { todos in
            let model = todos.first!
            self.nameTextField.text = model.name
            self.descriptionTextField.text = model.description
            self.notesTextField.text = model.notes
            self.completedSwitch.isOn = model.completed
            
            self.viewModel = TodoViewModel(todo: model)
        }
        setupUpdateSignals()
    }
    
    private func setupUpdateSignals() {
        nameTextField.reactive.continuousTextValues.observeValues { (values: String?) -> () in
            if let newName = values {
                let newTodo = todoNameLens.set(newName, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        
        descriptionTextField.reactive.continuousTextValues.observeValues { (values: String?) -> () in
            if let newDescription = values {
                let newTodo = todoDescriptionLens.set(newDescription, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        
        notesTextField.reactive.continuousTextValues.observeValues { (values: String?) -> () in
            if let newNotes = values {
                let newTodo = todoNotesLens.set(newNotes, self.viewModel.todo!)
                store.dispatch(UpdateTodoAction(todo: newTodo))
            }
        }
        
        completedSwitch.reactive.isOnValues.observeValues { (value: Bool) -> () in
            let newTodo = todoCompletedLens.set(value, self.viewModel.todo!)
            store.dispatch(UpdateTodoAction(todo: newTodo))
        }
    }

}
