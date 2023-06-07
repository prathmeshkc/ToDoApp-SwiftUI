//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewmodel = ToDoListItemViewViewModel()
    
    let todoListItem: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment:.leading){
                Text(todoListItem.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: todoListItem.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            
            Spacer()
            
            Button(action: {
                viewmodel.toggleIsDone(item: todoListItem)
            }, label: {
                Image(systemName: todoListItem.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            })
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(todoListItem: .init(
            id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
    }
}
