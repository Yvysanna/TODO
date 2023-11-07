//
//  Model.swift
//  TODO
//
//  Created by Yvette Schröder on 19/10/2023.
//

import Foundation

// UUID so that we can use ForEach loop
struct TaskModel: Hashable, Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var isCompleted: Bool
}


