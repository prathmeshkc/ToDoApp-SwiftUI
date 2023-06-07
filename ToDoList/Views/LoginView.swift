//
//  LoginView.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things done!", angle: 15, backgroundColor: Color.pink,
                yOffset: -100)
                
                //Login Form with Buttons
                Form{
                    
                    //Error Message when fields empty
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Enter Email Address", text: $loginViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Enter Password", text: $loginViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                 
                    TLButton(label: "LOG IN", background: .blue) {
                        //Attemp log in
                        loginViewModel.login()
                    }
                    
                }
                .padding(10)
                .offset(y: -30)
                
                
                //Create an account
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create an Account!") {
                        RegisterView()
                    }
                }.padding(.bottom, 50)
                
                
                Spacer()
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
