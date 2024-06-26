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
}
