//
//  FlashCardViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/9/24.
//

import Foundation
import SwiftUI

class FlashCardViewViewModel: ObservableObject {
    @Published  var flashcards:[FlashCard]
    @Published  var index:Int
    @Published  var isListView:Bool
    
    
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
    
    func updateFlashCard(flashCard: FlashCard){
        if let index = flashcards.firstIndex(where: {$0.id == flashCard.id}){
            flashcards[index] = flashCard
            
        }
    }

    

}

