//
//  TLButton.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 25/12/2024.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    // Optional closure for button actions
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(background)
                    .frame(height: 35)
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(
            title:"Button Name",
            background: .pink
        ) {
//            action
        }
    }
}
