//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Абубакир on 28.10.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var item: [ToDoListItem]
    
    init(userID: String) {
        self._item = FirestoreQuery(
            collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userID: userID)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(item) {item in
                    ToDoListItemsView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "tatdZAwWVFWNC78wQcYPg9BwZof2")
}
