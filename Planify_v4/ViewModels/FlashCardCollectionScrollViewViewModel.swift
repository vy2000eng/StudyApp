//
//  FlashCardCollectionScrollViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/13/24.
//

import Foundation
import SwiftUI


class FlashCardCollectionScrollViewViewModel: ObservableObject {
//    @Published  var subject:Subject
//
//    init(subject: Subject) {
//        self.subject = subject
//    }
    @Published var titles: [FlashCard]
    var updateIndex: (Int) ->Void
    var index:Int
    // let names = ["sam", "mike", "John", "Kevin", "James"]
    //@Published var selectedIndex: Int
   // @Published var currentIndex: Int
    init(titles: [FlashCard], index: Int,updateIndex: @escaping (Int) -> Void) {
        
        self.titles = titles
        self.index = index
        self.updateIndex = updateIndex
    }
    
    
    func updateIdx(index:Int){
        self.index = index
        saveChanges()
    }
    
    func saveChanges(){
        updateIndex(index)
    }
    
    
//    init(titles: [FlashCard], selectedIndex: Int  , currentIndex: Int = 0) {
//        self.titles = titles
//        self.selectedIndex = selectedIndex
//        self.currentIndex = currentIndex
//    }

    
    

    

}
