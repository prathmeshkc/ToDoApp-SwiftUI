//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class RegisterViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    
    
    init() {
        
    }
    
    
    func register() {
        guard validate() else {
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(userId: userId)
        }
    }
    
    private func insertUserRecord(userId: String) {
        
        let newUser = User(
            id: userId,
            name: fullName,
            email: email,
            joinedAt: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
        
    }
    
    
    
    
    private func validate() -> Bool {
        
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
