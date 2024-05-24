//
//  FlashCardAddView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/22/24.
//

import SwiftUI

struct FlashCardAddView: View {
    @Environment(\.dismiss) private var dismiss
    
    
    @State var flashcard = FlashCard()
    @State var isEditingFront = false
    @State var isEditingBack = false
    
    var onInsert: (FlashCard) -> Void
    
    init(insertFlashCardCallBack: @escaping (FlashCard)->Void){
        onInsert = insertFlashCardCallBack
        
    }
    
    func triggerInsertFlashCardCallBack(flashcard: FlashCard){
        
        onInsert(flashcard)
        
    }
    
    
    
    var body: some View {
        Form{
            if !isEditingFront{
                TextField(text:$flashcard.front, label: {
                    Text("Term")
                })
                .onTapGesture{
                    isEditingFront = true
                    isEditingBack = false
                }
            }else{
                TextEditor(text: $flashcard.front)
            }
            if !isEditingBack{
                TextField(text:$flashcard.back, label: {
                    Text("Defintion")
                })
                .onTapGesture {
                
                    isEditingBack = true
                    isEditingFront = false
                }
            }else{
                TextEditor(text: $flashcard.back)
            }
            
            Button(action: {
                isEditingBack = false
                isEditingFront = false
                triggerInsertFlashCardCallBack(flashcard: flashcard)
                dismiss()
            },
                   label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.blue)
                    Text("save")
                        .foregroundColor(Color.white)
                        .bold()
                }
            })
        }
    }
}

#Preview {
    NavigationView{
        @State  var flashCards = Subject.sampleData[0].flashcards
        var subjects = Subject.sampleData

        @ObservedObject var grandParentViewModel = SubjectViewViewModel(subjects: subjects)
        @ObservedObject var parentViewModel = SubjectDetailsViewViewModel(subject: grandParentViewModel.subjects[0], updateParent: grandParentViewModel.updateSubject)
        @ObservedObject var childViewModel = FlashCardViewViewModel(flashcards: parentViewModel.subject.flashcards,flashCardUpdateCallBack: parentViewModel.saveFlashCards)
       // @StateObject  var parentViewModel = FlashCardViewViewModel(flashcards: flashCards)
        FlashCardAddView(insertFlashCardCallBack: childViewModel.insertFlashCard)

        
    }
}
