//
//  FlashCardContentViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/13/24.
//
import Foundation
import SwiftUI


class FlashCardContentViewViewModel: ObservableObject {

    var flashcard:FlashCard
    var isShowingFront:Bool
    var cardIndex:Int
    

    init(flashcard: FlashCard, isShowingFront: Bool = true, cardIndex: Int) {
        self.flashcard = flashcard
        self.isShowingFront = isShowingFront
        self.cardIndex = cardIndex
       // self.fcViewModel = fcViewModel
    }
    
    func toggleIsShowingFront(){
        isShowingFront.toggle()
    }
    
    func updateFront(front:String){
        flashcard.front = front
    }
    
    func updateBack(back:String){
        flashcard.back = back
    }
    

    

}
