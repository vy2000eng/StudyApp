//
//  FlashCardEditViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/15/24.
//

import Foundation

class FlashCardEditViewViewModel: ObservableObject{
  
     @Published var flashCard : FlashCard
    var onFlashCardUpdate: (FlashCard) ->Void
    @Published var isEditing = false
    //@Published var confirm = false
    struct editingState{
        var isEditing: Bool = false
        var onConfirm: Bool = false
        var clickCount:Int = 0
    }
    
    @Published var saveEditState = editingState()
    

    
    
    init(flashCard: FlashCard, onFlashCardUpdate: @escaping (FlashCard)->Void) {
        self.flashCard = flashCard
        self.onFlashCardUpdate = onFlashCardUpdate
    }
    
    func toggleIsEditting(){
        isEditing.toggle()
    }
//    
//    func updateFront(front:String){
//        flashCard.front = front
//        saveChanges()
//
//    }
//    
//    func updateBack(back:String){
//        flashCard.back = back
//        saveChanges()
//
//    }
    
    func saveChanges(flashcard:FlashCard){
        resetSaveEditState()
        
        onFlashCardUpdate(flashCard)
        print("onflashCardUodate in EditViewModel called")
        print(flashCard)
        
    }
    
    func resetSaveEditState(){
        saveEditState.clickCount = 0
        saveEditState.isEditing = false
        saveEditState.onConfirm = false
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
