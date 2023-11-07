//
//  AddView.swift
//  TODO
//
//  Created by Yvette Schröder on 19/10/2023.
//
// THIS IS FIXED!!!!!

import SwiftUI
import SwiftData

struct AddView: View {
    
    @Environment(\.dismiss) private var dismiss // For moving back in view hierarchy
    @Environment(\.modelContext) var context

    
    @State var textFieldTitle: String = ""
    @State var textFieldDescription: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("What do you need to do?",
                          text: $textFieldTitle)
                TextField("Add description (optional)",
                          text: $textFieldDescription)
            }
            .navigationTitle("Add Item ✏️")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let item = Item(title: textFieldTitle,
                                        desc: textFieldDescription,
                                        isCompleted: false)
                        context.insert(item)
                        dismiss()
                    }
                    .disabled(textFieldTitle.count < 1) // If nothing entered, can't save
                }
            }
        }
    }
}



#Preview {
    NavigationView {
        AddView()
    }
}
