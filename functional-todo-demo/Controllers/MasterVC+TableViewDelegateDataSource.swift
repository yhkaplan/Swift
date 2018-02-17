//
//  MasterVC+TableViewDelegateDataSource.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/17.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import UIKit

// MARK: UITableViewDataSource
extension MasterViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        let todo = viewModel.todoForIndexPath(indexPath)
        cell.configure(todo)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MasterViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let todo = viewModel.todoForIndexPath(indexPath)
        store.dispatch(ToggleCompletedAction(todo: todo))
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //TODO: Emply func, to research
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let todo = self.viewModel.todoForIndexPath(indexPath)
        
        //TODO: Read more about UITableViewRowActions
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { _, _ in
            store.dispatch(DeleteTodoAction(todo: todo))
        }
        delete.backgroundColor = .red
        
        let details = UITableViewRowAction(style: .normal, title: "Details") { _, _ in
            store.dispatch(DetailsTodoAction(todo: todo))
            
            self.performSegue(withIdentifier: "segueShowDetails", sender: self)
        }
        details.backgroundColor = .orange
        
        return [details, delete]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        //The cells here must be editable; TODO: fix
        return true
    }
}
