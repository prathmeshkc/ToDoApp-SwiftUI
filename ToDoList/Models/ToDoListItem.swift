//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
    
    
}
