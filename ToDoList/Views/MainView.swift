//
//  ContentView.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainViewViewModel = MainViewViewModel()
    
    
    var body: some View {
        
        if mainViewViewModel.isSignedIn, !mainViewViewModel.currentUserId.isEmpty {
            //Already Signed In
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: mainViewViewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
