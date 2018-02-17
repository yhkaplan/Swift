//
//  MasterViewController.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/15.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    var viewModel = TodosViewModel(todos: []) {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTodos { response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let response = response {
                store.dispatch(LoadTodosAction(todos: response))
            } else {
                fatalError("Unexpected error")
            }
        }
        
        filterSegmentedControl.addTarget(self, action: #selector(MasterViewController.filterValueChanged), for: .valueChanged)
        
        store.activeFilter.producer.startWithValues { filter in
            self.filterSegmentedControl.selectedSegmentIndex = filter.rawValue
        }
        
        store.activeTodos.startWithValues { todos in
            self.viewModel = TodosViewModel(todos: todos)
        }
        
        store.notSyncedWithBackend.startWithValues { todos in
            addOrUpdateTodo(todos) { response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                print("Success")
            }
        }
    }
}

// MARK: - Actions
extension MasterViewController {
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create", message: "Create a new item", preferredStyle: .alert)
        
        let placeholders = [
            "ID",
            "Name",
            "Description",
            "Notes"
        ]
        
        for i in 0..<placeholders.count {
            alertController.addTextField { textField in
                textField.placeholder = placeholders[i]
            }
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
            
        alertController.addAction(UIAlertAction(title: "Create", style: .default) { _ in
            
            guard let id = alertController.textFields?[0].text,
                let name = alertController.textFields?[1].text,
                let description = alertController.textFields?[2].text,
                let notes = alertController.textFields?[3].text else { return }
            
            store.dispatch(CreateTodoAction(todoId: Int(id)!, name: name, description: description, notes: notes))
        })
        
        present(alertController, animated: true)
    }
    
    @objc func filterValueChanged() {
        guard let newFilter = TodoFilter(rawValue: filterSegmentedControl.selectedSegmentIndex) else { return }
        
        store.dispatch(SetFilterAction(filter: newFilter))
    }
}
