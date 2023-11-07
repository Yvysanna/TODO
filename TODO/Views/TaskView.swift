//
//  TaskView.swift
//  TODO
//
//  Created by Yvette Schröder on 19/10/2023.
//

import SwiftUI
import SwiftData

struct TaskView: View {

    @Bindable var item: Item
    
    // How a task will look like
    var body: some View {
        HStack {
            
            // Ternary operator for different image depending on task completion
            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    item.isCompleted = !item.isCompleted
                }
            VStack (alignment: .leading) {
                Text(item.title).foregroundStyle(.primary)
                Text(item.desc).foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
    
}

struct TaskView_Previews: PreviewProvider {
    
    // Display two different components for view checking
    static var task1 = Item(title: "First task", desc: "Not important", isCompleted: false)
    static var task2 = Item(title: "Second task", desc: "Not important", isCompleted: true)
    
    static var previews: some View {
        Group {
            TaskView(item: task1)
            TaskView(item: task2)
        }
        .previewLayout(.sizeThatFits) // Display preview only for component but not full iPhone
    }
}
