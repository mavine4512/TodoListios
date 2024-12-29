//
//  ToDoListView.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 13/11/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items){ item in
                    ToDoListItemView(item: item)
                        .contextMenu  {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundColor( Color.red)
                                Image(systemName: "trash")
                            }

//                        .swipeActions {
//                            Button {
////                                // Delete
//                            viewModel.delete(id: item.id)
//                            } label: {
//                                Text("Delete")
//                                    .foregroundColor( Color.red)
//                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName:"plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented:
                                $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "zDkdZcO4ZlhYmuJkQJx9VENUGSl2")
    }
}
