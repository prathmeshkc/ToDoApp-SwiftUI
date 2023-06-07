//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
