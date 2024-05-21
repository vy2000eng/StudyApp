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
    var onFlashCardUpdate: (FlashCard) -> Void
    @Published var emptyFlashCard = FlashCard()
    @Published var isPresentingEditingView = false

    
    init(flashcards: [FlashCard], updateParentFlashCard: @escaping(FlashCard) ->Void ){
        self.onFlashCardUpdate = updateParentFlashCard
        self.flashcards = flashcards
    }
    
    
    
    
    func updateFlashCardCallBackFunc(flashCard:FlashCard){
        flashcards[index] = flashCard
        onFlashCardUpdate(flashCard)
    }
    
    
    
    
//    init(flashCardViewModel: FlashCardViewViewModel) {
//        self.flashCardViewModel = flashCardViewModel
//    }

    

    

}
