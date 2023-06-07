//
//  TLButton.swift
//  ToDoList
//
//  Created by Prathmesh Chaudhari on 5/23/23.
//

import SwiftUI

struct TLButton: View {
    
    let label: String
    let background: Color
    let action: () -> Void
    
    
    var body: some View {
        Button(action: {
            //Action
            action()
        }, label: {
            ZStack{
                RoundedRectangle(
                    cornerRadius: 10
                ).foregroundColor(background)
                
                Text(label)
                    .bold()
                    .foregroundColor(Color.white)
                
            }
        })
        .padding(EdgeInsets(top: 20, leading:0 , bottom: 20, trailing: 0))
       
        
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(label: "LOG IN", background: .blue) {
            
        }
    }
}
