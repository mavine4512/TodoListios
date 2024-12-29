//
//  RegisterView.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import SwiftUI
    

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Rigester",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       background: .yellow,
                       offset: -150
            )
            
            Form {
                TextField("Full Name", text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                
                TextField("Enter email", text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                
                SecureField("Password", text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title:"Create Account",
                    background: .green
                ) {
                    // Perform your action here
                    viewModel.register()
                }
                
            }
            .offset(y:-60)
            Spacer()
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
