//
//  FlashCardListViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/13/24.
//
import Foundation
import SwiftUI


class FlashCardListViewViewModel: ObservableObject {
//    @Published  var subject:Subject
//
//    init(subject: Subject) {
//        self.subject = subject
//    }
  //  @Published var flashCardViewModel: FlashCardViewViewModel
    //@Published var editingFlashCard = FlashCard(front: "", back:"" )
    @Published var index = 0
    @Published var flashcards: [FlashCard]
    var updateParentFlashCard: (FlashCard) -> Void
    @Published var emptyFlashCard = FlashCard()
    @Published var isPresentingEditingView = false

    
    init(flashcards: [FlashCard], updateParentFlashCard: @escaping(FlashCard) ->Void ){
        self.updateParentFlashCard = updateParentFlashCard
        self.flashcards = flashcards
    }
    
    
    
    
    func updateFlashCardCallBackFunc(){
        updateParentFlashCard(emptyFlashCard)
    }
    
    
    
    
//    init(flashCardViewModel: FlashCardViewViewModel) {
//        self.flashCardViewModel = flashCardViewModel
//    }

    

    

}
