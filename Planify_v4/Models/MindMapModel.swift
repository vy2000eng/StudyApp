//
//  MindMapModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//

import Foundation

struct MindMap: Identifiable{
    let id: UUID
    let title: String
    let creationDate: Date
    
    init(id: UUID = UUID(), title: String,  creationDate: Date = Date.now) {
        self.id = id
        self.title = title
        self.creationDate = creationDate
    }
    
}
