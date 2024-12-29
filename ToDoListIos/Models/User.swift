//
//  User.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
