//
//  FlashCardContentViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/13/24.
//
import Foundation
import SwiftUI


class FlashCardContentViewViewModel: ObservableObject {

    @Published var flashcard:FlashCard
    @Published var isShowingFront:Bool
    var updateParent: (FlashCard) -> Void
    

    init(flashcard: FlashCard, isShowingFront: Bool = true, updateParent: @escaping (FlashCard) -> Void) {
        self.flashcard = flashcard
        self.isShowingFront = isShowingFront
        self.updateParent = updateParent
      
    }
    
    func toggleIsShowingFront(){
        isShowingFront.toggle()
       // saveChanges()
    }
    
    func updateFront(front:String){
        flashcard.front = front
        saveChanges()

    }
    
    func updateBack(back:String){
        flashcard.back = back
        saveChanges()

    }
    
    func saveChanges()
    {
        updateParent(flashcard)
    }
    

    

}
