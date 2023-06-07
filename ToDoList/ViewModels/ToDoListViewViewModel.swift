//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import Foundation
import FirebaseFirestore


class ToDoListViewViewModel: ObservableObject {
    
    
    @Published var isSheetPresented = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    
    
}
