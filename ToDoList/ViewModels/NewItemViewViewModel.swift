//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class NewItemViewViewModel: ObservableObject {
    
    @Published var taskTitle = ""
    @Published var dueDate = Date()
    @Published var showValidationAlert = false
    
    
    init(){}
    
    
    
    
    func saveTask() {
        guard canSaveTask else {
            return
        }
        
        //Get current userId
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create a ToDoListItem model
        let newItemId = UUID().uuidString
        let newToDoListItem = ToDoListItem(
            id: newItemId,
            title: taskTitle,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        //save to the firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItemId)
            .setData(newToDoListItem.asDictionary())
    }
    
    var canSaveTask: Bool {
        guard !taskTitle.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        //Due date is  >= yesterday
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
}

