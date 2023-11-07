//
//  ContentView.swift
//  TODO
//
//  Created by Yvette Schröder on 22/09/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // Model is context for this file
    @Environment(\.modelContext) var context
    
//    @EnvironmentObject var todoViewModel: TodoViewModel // TODO: Remove this
    
    @Query var items: [Item] = [] // Automatically fetching data on change
    @State private var isShowingItemSheet = false
    @State private var itemToEdit: Item? // TODO: Integrate for view later
    
    @State private var hideCompleted: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) {item in
                    TaskView(item: item)
                        // Swipe right for editing
                        .swipeActions(edge: .leading) {
                            Button("Edit", systemImage: "pencil") {
                                itemToEdit = item
                            }
                        }
                }
                // Swipe left for deleting
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(items[index])
                    }
                }
                Button("Add tasks") { isShowingItemSheet = true }
            }
            
        }
        // Header Line of this View
        .navigationTitle("TODO ✏️")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                if !items.isEmpty {
                    Button("Add item", systemImage: "note.text.badge.plus") {
                        isShowingItemSheet = true
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingItemSheet) { AddView() }
        .sheet(item: $itemToEdit) {item in
            EditItem(item: item)
        }

        .overlay {
            if items.isEmpty {
                ContentUnavailableView( label: {
                    Label("Nothing to do", systemImage: "list.bullet.rectangle.portrait")

                }, description: {
                    Text("Add tasks to see your list")
                }, actions: {
                    Button("Add tasks") { isShowingItemSheet = true }
                })
                .offset(y: -60)
            }
        }
//        Button("Add Item", systemImage: "plus") {
//            isShowingItemSheet = true
//        }
    }
}




#Preview {
    ContentView()
}

struct EditItem: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var item: Item
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Item Name", text: $item.title)
                TextField("Description", text: $item.desc)
            }
            .navigationTitle("Update Item")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
               
