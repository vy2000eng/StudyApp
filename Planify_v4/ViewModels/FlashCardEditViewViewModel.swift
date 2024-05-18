//
//  FlashCardEditViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/15/24.
//

import Foundation

class FlashCardEditViewViewModel: ObservableObject{
  
    @Published var editingFlashCard : FlashCard

    
    
    init(editingFlashCard: FlashCard) {
        self.editingFlashCard = editingFlashCard
    }
    
    
//    @Published var fcViewModel: FlashCardViewViewModel
//    @Published var index : Int
//
//    //@Published var flashCard: FlashCard
//
//
//
//    init(fcViewModel: FlashCardViewViewModel, index: Int) {
//        self.fcViewModel = fcViewModel
//        self.index = index
//    }
    
}
