//
//  FlashCardAddView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/22/24.
//

import SwiftUI

struct FlashCardAddView: View {
    @Environment(\.dismiss) private var dismiss
    @State var showingSaveAlert = false
    
    
    @State var flashcard = FlashCard(front: "Term...           ", back: "Definition...          ")
  

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
            VStack(alignment: .leading){
                Text(flashcard.front)
                    .foregroundColor(focusedField == .front ? .clear:.gray).padding(8)
                    .overlay(
                        TextEditor(text:$flashcard.front)
                            .focused($focusedField, equals: .front)
                            .foregroundColor(focusedField == .front ? .black:.clear)
                    )
                    .frame(minHeight: 20.0)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.subheadline)
                    .padding([.leading, .trailing,.top])
                    .onTapGesture {
                        if flashcard.front == "Term...           "{
                            flashcard.front = ""
                        }
                        if flashcard.back.isEmpty{
                            flashcard.back = "Definition...          "
                        }
                        focusedField = .front
                    }
                
                Rectangle()
                    .frame(height: 2) // Adjust thickness here
                    .foregroundColor(.black) // Set color to match a typical divider
                    .opacity(0.5)
                
                //VStack {
                    Text(flashcard.back)
                        .foregroundColor(focusedField == .back ? .clear:.gray).padding(8)
                        .overlay(
                            TextEditor(text:$flashcard.back)
                                .focused($focusedField, equals: .back)
                                .foregroundColor(focusedField == .back ? .black:.clear)
                        )
                        .frame(minHeight: 20.0)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.subheadline)
                        .padding([.leading, .trailing,.top])
                        .onTapGesture {
                            if flashcard.front.isEmpty{
                                flashcard.front = "Term...           "
                            }
                            
                            if flashcard.back == "Definition...          "{
                                flashcard.back = ""
                            }
                            focusedField = .back
                         
                        }
               // }
            }
            Button(action: {
                showingSaveAlert = true
              
                //triggerInsertFlashCardCallBack(flashcard: flashcard)
                //dismiss()
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
            .alert(isPresented: $showingSaveAlert) {
                          Alert(
                              title: Text("Confirm Save"),
                              message: Text("Are you sure you want to save this flashcard?"),
                              primaryButton: .destructive(Text("Save")) {
                                 // onInsert(flashcard)
                                  triggerInsertFlashCardCallBack(flashcard: flashcard)

                                  dismiss()
                              },
                              secondaryButton: .cancel()
                          )
                      }
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

