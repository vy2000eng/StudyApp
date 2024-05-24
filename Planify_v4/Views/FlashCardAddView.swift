//
//  FlashCardAddView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/22/24.
//

import SwiftUI

struct FlashCardAddView: View {
    @Environment(\.dismiss) private var dismiss
    
    
    @State var flashcard = FlashCard(front: "Term...           ", back: "Definition...          ")
    @State var isEditingFront = false
    @State var isEditingBack = false
    @State var countFront = 0
    @State var countBack = 0
 
    
    
    enum Field: Hashable {
          case front
          case back
      }
    
    @FocusState private var focusedField: Field?
    
    
    var onInsert: (FlashCard) -> Void
    
    init(insertFlashCardCallBack: @escaping (FlashCard)->Void){
        onInsert = insertFlashCardCallBack
        
    }
    
    func triggerInsertFlashCardCallBack(flashcard: FlashCard){
        
        onInsert(flashcard)
        
    }
    
    
    
    var body: some View {
        Form{
            VStack {
                    if isEditingFront {
                        Text(flashcard.front).foregroundColor(.clear).padding(8)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                TextEditor(text:$flashcard.front)
                                    .focused($focusedField, equals: .front)

                            )
                            .frame(minHeight: 20.0)
                    } else {
                        Text(flashcard.front)
                            .fixedSize(horizontal: false, vertical: true) // Expand vertically based on content
                            .foregroundColor(.gray)
                    }
                }
                .font(.subheadline)
                .padding([.leading, .trailing,.top])
                .onTapGesture {
                    isEditingFront = true
                    isEditingBack = false
                    focusedField = .front
                    if countFront == 0{
                        flashcard.front = ""
                    }
                    countFront+=1

                }.onSubmit {
                    countFront = 0
                }
            
            
            
            VStack {
                if isEditingBack {
                    Text(flashcard.back).foregroundColor(.clear).padding(8)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            TextEditor(text:$flashcard.back)
                                .focused($focusedField, equals: .back)

                        )
                        .frame(minHeight: 20.0)
                } else {
                    Text(flashcard.back)
                        .fixedSize(horizontal: false, vertical: true) // Expand vertically based on content
                        .foregroundColor(.gray) // Expand vertically based on content
                }
            }
            .font(.subheadline)
            .padding([.leading, .trailing,.top])
            .onTapGesture {
                isEditingFront = false
                isEditingBack = true
                focusedField = .back
                if countBack == 0{
                    flashcard.back = ""
                }
                countBack+=1
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


//if isEditingFront {
//                Text(flashcard.front).foregroundColor(.clear).padding(8)
//
//                    .frame(maxWidth: .infinity)
//                    .overlay(
//                        TextEditor(text: $flashcard.front)
//
//                    )
//                    .frame(minHeight: 20.0)
//            } else {
//                Text(flashcard.front)
//                    .fixedSize(horizontal: false, vertical: true) // Expand vertically based on content
//            }
