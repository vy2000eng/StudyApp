//
//  MainVIew.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//

import Foundation

struct Location: Identifiable{
    let id: UUID
    let name: String
    let description:String
   // let mindMapId: MindMap.ID
    
    init(id: UUID = UUID(), name: String,description: String) {
        self.id = id
        self.name = name
      //  self.mindMapId = mindMapId
        self.description = description
    }
}


//extension Location{
//    static let sampleData: [Location] = [
//        Location(name: <#T##String#>, description: <#T##String#>)
//    
//    ]
//    
//    
//    
//}
