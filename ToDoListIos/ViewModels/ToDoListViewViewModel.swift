//
//  ToDoListViewViewModel.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import FirebaseFirestore
import Foundation

// ViewModel for List of items view
// primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId:String) {
        self.userId = userId
    }
    
//    Delete to do list item
//   Parameter id: item id to delete
    func delete (id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
