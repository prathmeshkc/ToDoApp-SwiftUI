//
//  NewItemView.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100)
            
            Form{
                //Task title
                TextField("Task", text: $viewModel.taskTitle)
                    .font(.system(size: 32))
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                // Submit Button
                TLButton(label: "Add Task", background: .pink, action: {
                    if viewModel.canSaveTask {
                        viewModel.saveTask()
                        newItemPresented = false
                    } else{
                        viewModel.showValidationAlert = true
                    }
 
                })
                .padding()
                
            }
            .alert(isPresented: $viewModel.showValidationAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all the details and select the due date that is today or newer"))
            })
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get:{
            return true
        }, set: { _ in
            
        }))
    }
}
