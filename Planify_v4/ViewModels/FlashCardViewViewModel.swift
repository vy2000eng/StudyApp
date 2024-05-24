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
    @Published var selectedTab = 0
    @Published var isPresentingAddView = false
    var onFlashCardsupdate: ([FlashCard]) -> Void

    
    
    init(flashcards: [FlashCard], index: Int = 0, isListView: Bool = false, flashCardUpdateCallBack:@escaping ([FlashCard])->Void) {
        self.flashcards = flashcards
        self.index = index
        self.isListView = isListView
        self.onFlashCardsupdate = flashCardUpdateCallBack
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
    
    func insertFlashCard(flashcard:FlashCard){
        flashcards.append(flashcard)
        onFlashCardsupdate(flashcards)

        
    }
    
    func updateFlashCards(){
        onFlashCardsupdate(flashcards)
    }
    
    func updateFlashCard(flashcard : FlashCard){
      //  print("updateFlashCard Called")
       // print(flashcard)

        if let index = flashcards.firstIndex(where: {$0.id == flashcard.id}){
       
            flashcards[index] = flashcard
            onFlashCardsupdate(flashcards)

       

            
        }
    }

    

}

