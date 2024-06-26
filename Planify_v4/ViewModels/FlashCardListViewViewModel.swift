//
//  FlashCardListViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/13/24.
//
import Foundation
import SwiftUI


class FlashCardListViewViewModel: ObservableObject {

    @Published var index = 0
    @Published var flashcards: [FlashCard]
    var onFlashCardUpdate: (FlashCard) -> Void
    var edittingFlashCard = FlashCard()
    @Published var isPresentingEditingView = false
    @Published var isPresentingAddView = false
    
    
    init(flashcards: [FlashCard], updateParentFlashCard: @escaping(FlashCard) ->Void ){
        self.onFlashCardUpdate = updateParentFlashCard
        self.flashcards = flashcards
    }
    
    func updateFlashCardCallBackFunc(flashCard:FlashCard){
        isPresentingEditingView = false
        flashcards[index] = flashCard
        onFlashCardUpdate(flashCard)
        print("updatesFlashCardCallBackFunc called")
        print(flashcards[index])
    }
}
