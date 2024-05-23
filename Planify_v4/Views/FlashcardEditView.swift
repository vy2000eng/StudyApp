//
//  SwiftUIView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/15/24.
//

import SwiftUI

struct FlashCardEditView: View {
    @StateObject var viewModel: FlashCardEditViewViewModel

    init(flashCard: FlashCard, onFlashCardUpdate: @escaping (FlashCard) -> Void) {
        self._viewModel = StateObject(wrappedValue: FlashCardEditViewViewModel(flashCard: flashCard, onFlashCardUpdate: onFlashCardUpdate))
    }
    //@State var isEditting = false
    
    
    var body: some View {
        Form{
            VStack(alignment: .leading) {
                VStack {
                    if viewModel.saveEditState.isEditing {
                        Text(viewModel.flashCard.front).foregroundColor(.clear).padding(8)
                            .frame(maxWidth: .infinity)
                                           .overlay(
                                               TextEditor(text: $viewModel.flashCard.front)
                                           )
                                           .frame(minHeight: 20.0)
//                        TextEditor( text: $viewModel.flashCard.front)
//                          .frame(minHeight: 200)
                    } else {
                        Text(viewModel.flashCard.front)
                            .fixedSize(horizontal: false, vertical: true) // Expand vertically based on content
                    }
                }
                .font(.title)
                .bold()
               // .multilineTextAlignment(.leading)
                .padding([.leading, .trailing,.top])
                Rectangle()
                    .frame(height: 2) // Adjust thickness here
                    .foregroundColor(.black) // Set color to match a typical divider
                    .opacity(0.5)
                    .padding([.leading, .trailing])
                
                ScrollView(content: {
                    HStack {
                        
                        if viewModel.saveEditState.isEditing {

                            Text(viewModel.flashCard.back).foregroundColor(.clear).padding(8)
                                .frame(maxWidth: .infinity)
                                               .overlay(
                                                   TextEditor(text: $viewModel.flashCard.back)
                                               )
                                               .frame(minHeight: 20.0)
                         
                      
                            
                                //.frame(minHeight: 400)
                        } else {
                            Text(viewModel.flashCard.back)
                                .fixedSize(horizontal: false, vertical: true) // Expand vertically based on content

                        }
                    }
                    .padding(.horizontal)
                    .font(.subheadline)
                })
                
                
            }
        }
        .font(.system(size: 18, weight: .bold, design: .default))
        .lineLimit(nil)
        .scaleEffect(viewModel.saveEditState.isEditing ? 1.1 : 1.0) // Slightly enlarge text when editing
        
        .toolbar{
            
            ToolbarItem(placement: .confirmationAction, content: {
                Button(  viewModel.saveEditState.isEditing ? "save" : "edit"){
                    viewModel.saveEditState.clickCount += 1
                    if viewModel.saveEditState.clickCount == 1{
                        viewModel.saveEditState.isEditing = true
                    }
                    if viewModel.saveEditState.clickCount == 2{
                        viewModel.saveEditState.onConfirm = true
                    }
                    
                    //viewModel.isEditing = viewModel.isEditing ? false:true
                   // viewModel.toggleIsEditting()
                    
               
                    
                }
                .alert(isPresented: $viewModel.saveEditState.onConfirm) {
                    Alert(
                        title: Text("Current Location Not Available"),
                        message: Text("Your current location can’t be " +
                                      "determined at this time."),
                        primaryButton: .default(
                            Text("ok"),
                            action: {
                                viewModel.saveChanges(flashcard: viewModel.flashCard)
                               // viewModel.resetSaveEditState()

                                
                            }
                            
                        ),
                        secondaryButton: .destructive(
                                      Text("Delete"),
                                      action: {
                                          
                                          viewModel.saveChanges(flashcard: viewModel.flashCard)
                                        //  viewModel.resetSaveEditState()

                                      }
                                  )
                        
                    )
                }
                    
                
            })
            
            
        }
    }
}


struct FlashCardEditView_Previews: PreviewProvider {
    
    @ObservedObject static var fcVm = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
    @ObservedObject static var vm = FlashCardListViewViewModel(flashcards:Subject.sampleData[1].flashcards,updateParentFlashCard: {updatefc in fcVm.updateFlashCard(flashcard: updatefc)});
//                                                               updateParentFlashCard: {fc in }))
    
    
   // @ObservedObject static var viewModel = FlashCardEditViewViewModel(fcViewModel: fcViewModel,index:0)up

    static var previews: some View {
        let sampleFlashcards = Subject.sampleData[1].flashcards
        let fcVm = FlashCardViewViewModel(flashcards: sampleFlashcards)
        let vm = FlashCardListViewViewModel(flashcards: sampleFlashcards, updateParentFlashCard: { updatefc in
            fcVm.updateFlashCard(flashcard: updatefc)
        })

        let emptyCard = FlashCard(front: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", back: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        // Setup for preview
        NavigationView{

        var previewFlashCard = vm.edittingFlashCard
        if previewFlashCard.front.isEmpty && previewFlashCard.back.isEmpty {
            previewFlashCard = emptyCard
        }
            return FlashCardEditView(flashCard: previewFlashCard, onFlashCardUpdate:
                vm.updateFlashCardCallBackFunc
            )
            
        }
      
    }
}
