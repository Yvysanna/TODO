//
//  ItemModel.swift
//  TODO
//
//  Created by Yvette Schröder on 03/11/2023.
//

import Foundation
import SwiftData

@Model
class Item {
    var id: String
    var title: String
    var desc: String
    var isCompleted: Bool
    
    init(title: String, desc: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.desc = desc
        self.isCompleted = isCompleted
    }
}

