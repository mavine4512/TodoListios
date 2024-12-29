//
//  LoginView.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(
                           title: "To Do List",
                           subtitle: "Get Things done",
                           angle: 15,
                           background: .purple,
                            offset: -150
                )
                
    //            Login Fvorm
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButton(
                        title:"Log In",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                }
                .offset(y: -100)
                
    //            create Account
                VStack {
                    Text("New around here?")
                        .font(.subheadline)
                    NavigationLink("Create An Account", destination: RegisterView())
                }.padding(.bottom, 30)
                
//                Spacer()
            }
        }
//        .padding(0.0)
  }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
