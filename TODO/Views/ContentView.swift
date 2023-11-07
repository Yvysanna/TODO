//
//  ContentView.swift
//  TODO
//
//  Created by Yvette Schröder on 22/09/2023.
//

import SwiftUI

// TODO Tasks hardcoded for now, Render string and make it iterable
enum Task: String, CaseIterable {
    case task1, task2, task3, task4
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("[Task1]");
            
            Text("[Task2]");
            Divider()
             .frame(height: 1)
             .padding(.horizontal, 30)
             .background(Color.red)
            Text("[Task3]");
            Text("[Task4]");
            Text("Tap to create new task");
        }
    }
}

#Preview {
    ContentView()
}
