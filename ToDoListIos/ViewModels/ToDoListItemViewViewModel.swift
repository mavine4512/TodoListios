//
//  ToDoListItemViewViewModel.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
// ViewModel for single to do list item view (each row in item list)
// primary tab

class ToDoListItemViewViewModel: ObservableObject{
    init() {}
    
    func toggleIsDone (item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
