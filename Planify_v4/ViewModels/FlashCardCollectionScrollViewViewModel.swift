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
    // let names = ["sam", "mike", "John", "Kevin", "James"]
    //@Published var selectedIndex: Int
   // @Published var currentIndex: Int
    init(titles: [FlashCard]) {
        self.titles = titles
    }
    
//    init(titles: [FlashCard], selectedIndex: Int  , currentIndex: Int = 0) {
//        self.titles = titles
//        self.selectedIndex = selectedIndex
//        self.currentIndex = currentIndex
//    }

    
    

    

}
