//
//  WebServiceManager.swift
//  functional-todo-demo
//
//  Created by Joshua Kaplan on 2018/02/16.
//  Copyright © 2018年 Joshua Kaplan. All rights reserved.
//

import Foundation
import Alamofire

func sendRequest(method: Alamofire.HTTPMethod, request: RequestProtocol) {
    // Add headers
    let headers = configureHeaders(request)
    
    // Fetch request
    guard let request = try? URLRequest(url: "http://localhost:8080/todo/", method: method, headers: headers) else {
        return
    }
    Alamofire.request(request)
        .validate()
        .responseJSON { response in
            
            guard response.result.error == nil else {
                debugPrint("HTTP Request failed: \(response.result.error!.localizedDescription)")
                return
            }
            
            debugPrint("HTTP Request Body: \(response.data!)")
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
