//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView: View {
    
    @StateObject var viewmodel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewmodel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(todoListItem: item)
                        .swipeActions {
                            
                            Button("Delete") {
                                //Delete item
                                viewmodel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do")
            .toolbar{
                Button(action: {
                    //Navigate to NewItemView screen
                    viewmodel.isSheetPresented = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewmodel.isSheetPresented, content:{
                NewItemView(newItemPresented: $viewmodel.isSheetPresented)
            })
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "dk6vePHPPtNx43sa2mzoi1EOFNw1")
    }
}
