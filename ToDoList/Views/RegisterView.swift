//
//  RegisterView.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        
        VStack{
            //Header
            HeaderView(title: "Register", subtitle: "Start Organizing ToDos", angle: -15, backgroundColor: .orange,
            yOffset: -140)
            
            //Form
            Form{
                TextField("Full Name", text: $registerViewModel.fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.words)
                    .autocorrectionDisabled()
                
                TextField("Email", text: $registerViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $registerViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                TLButton(label: "Register", background: Color.green) {
                    //Attemp register
                    registerViewModel.register()
                }
                
            }
            

            
            
            
            Spacer()
        }
        
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
