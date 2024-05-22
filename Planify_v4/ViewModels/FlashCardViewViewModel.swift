//
//  FlashCardViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/9/24.
//

import Foundation
import SwiftUI

class FlashCardViewViewModel: ObservableObject {
    var flashcards:[FlashCard]
    @Published  var index:Int
    @Published  var isListView:Bool
    @Published var aBool = false
    
    
    init(flashcards: [FlashCard], index: Int = 0, isListView: Bool = false) {
        self.flashcards = flashcards
        self.index = index
        self.isListView = isListView
    }
    
    func toggleListView() {
        isListView.toggle()
    }
    
    func changeState(state:Int){
        index = state
        
    }
    
    func updateIndex(idx: Int){
        index = idx
    }
    
    func updateFlashCard(flashcard : FlashCard){
        print("updateFlashCard Called")
        print(flashcard)

        if let index = flashcards.firstIndex(where: {$0.id == flashcard.id}){
            print(index)
            objectWillChange.send()
            flashcards[index] = flashcard
            print("Flashcards updated: \(flashcards)")
            aBool.toggle()

            
        }
    }

    

}

