//
//  ProfileView.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user:user)
                }else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
//        Avatar
          Image(systemName: "person.circle")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
              .frame(width:120, height:120)
              .padding()
        
//                info: Name, Email, Member since
          VStack(alignment: .leading) {
              HStack {
                  Text("Name: ")
                      .bold()
               Text(user.name)
              }
              
              HStack {
                  Text("Email: ")
                      .bold()
               Text(user.email)
              }
              
              HStack {
                  Text("Member Since: ")
                      .bold()
               Text(dateFormatter.string(from: Date(timeIntervalSince1970: user.joined)))
//                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time .shortened))")
              }
       }
//                Sign Out
       TLButton(
           title: "Log Out",
                background: .red) {
           viewModel.logOut()
       }
           Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
