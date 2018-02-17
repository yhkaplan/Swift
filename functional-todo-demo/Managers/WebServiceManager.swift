//
//  WebServiceManager.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/16.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Alamofire

enum URLs {
    case postTodo
    case getTodos
    case getTodo
    case deleteTodo
    case deleteAll
    case update
}

extension URLs {
    func httpMethodURL() -> (String, String) {
        let baseURL = "http://localhost:8080/"
        
        switch self {
        case .postTodo:
            return ("POST", "\(baseURL)postTodo")
        case .getTodos:
            return ("GET", "\(baseURL)todos")
        case .getTodo:
            return ("GET", "\(baseURL)todo")
        case .deleteTodo:
            return ("DELETE", "\(baseURL)deleteTodo")
        case .deleteAll:
            return ("DELETE", "\(baseURL)deleteAll")
        case .update:
            return ("POST", "\(baseURL)updateTodo")
        }
    }
}

//method: Alamofire.HTTPMethod implementation changed
func sendRequest(_ url: URLs, request: RequestProtocol, completion: @escaping (_ responseData: Any?, _ error: Error?) -> Void) {
    // Add headers
    let headers = configureHeaders(request)
    
    // Fetch request
    let (methodString, urlString) = url.httpMethodURL()
    
    guard let method = HTTPMethod(rawValue: methodString), let url = URL(string: urlString) else {
        completion(nil, nil) //TODO: make error on right side
        return
    }
        
    guard let request = try? URLRequest(url: url, method: method, headers: headers) else {
        completion(nil, nil) //TODO: make error on right side
            return
    }
    
    //let manager = Alamofire.SessionManager.default
    Alamofire.request(request)
        .validate()
        .responseJSON { response in
            
            guard response.result.error == nil else {
                debugPrint("HTTP Request failed: \(response.result.error!.localizedDescription)")
                completion(nil, response.result.error)
                return
            }
            
            debugPrint("HTTP Request Body: \(response.data!)")
            completion(response.result.value, nil)
    }
}

func configureHeaders(_ request: RequestProtocol) -> [String: String] {
    let listOfProperties = request.getPropertyNames()
    var configuredRequestHeaders = [String: String]()
    
    for property in listOfProperties {
        let (propertyValue, propertyName) = request[property]
        if let name = propertyName {
            configuredRequestHeaders[name] = propertyValue
        }
    }
    return configuredRequestHeaders
}
