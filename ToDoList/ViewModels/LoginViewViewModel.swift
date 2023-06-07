//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        
        guard validate() else {
            print("Validation failed")
            return
        }
        
        //Try to login
        Auth.auth().signIn(withEmail: email, password: password)
        
        
        
        
    }
    
    private func validate() -> Bool {
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all the fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email."
            return false
        }
        
        return true
    }
}
