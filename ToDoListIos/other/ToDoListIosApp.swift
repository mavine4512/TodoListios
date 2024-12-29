//
//  ToDoListIosApp.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 09/11/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListIosApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
