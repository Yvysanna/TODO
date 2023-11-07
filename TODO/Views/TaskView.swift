//
//  TaskView.swift
//  TODO
//
//  Created by Yvette Schröder on 19/10/2023.
//

import SwiftUI

struct TaskView: View {
    let todo: TODO
    
    
    var body: some View {
        HStack{
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                VStack {
                    Text("[Taskname]");
                    Text("[Description]");
                    Text("[Date]");
                }
            }
        }
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 10)
         .background(Color.gray)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var todo = TODO.sampleData[0]
    static var previews: some View {
        TaskView(todo: todo)
    }
}
