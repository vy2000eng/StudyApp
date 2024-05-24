//
//  FlashCardEditViewHelper.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/23/24.
//

import SwiftUI

struct FlashCardEditViewHelper: View {
    @ObservedObject var viewModel: FlashCardEditViewViewModel
    
    var body: some View {
        mainView
        
    }
    @ViewBuilder
    var mainView:some View{
        Form{
            detailsView
        }
        .font(.system(size: 18, weight: .bold, design: .default))
        .lineLimit(nil)
        .scaleEffect(viewModel.saveEditState.isEditing ? 1.1 : 1.0)
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
                    
                }
                .alert(isPresented: $viewModel.saveEditState.onConfirm) {
                    Alert(
                        title: Text("Editing Flash Card"),
                        message: Text("Are you sure you want to make changes?"),
                        primaryButton: .default(
                            Text("ok"),
                            action: {
                                viewModel.saveChanges(flashcard: viewModel.flashCard)
                            }
                        ),
                        secondaryButton: .cancel(
                            Text("Cancel"),
                            action: {
                                viewModel.saveChanges(flashcard: viewModel.flashCard)
                            }
                        )
                    )
                }
            })
        }
    }
    
    
    @ViewBuilder
    var detailsView:some View{
        VStack(alignment: .leading) {
            VStack {
                if viewModel.saveEditState.isEditing {
                    Text(viewModel.flashCard.front).foregroundColor(.clear).padding(8)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            TextEditor(text: $viewModel.flashCard.front)
                        )
                        .frame(minHeight: 20.0)
                } else {
                    Text(viewModel.flashCard.front)
                        .fixedSize(horizontal: false, vertical: true) // Expand vertically based on content
                }
            }
            .font(.title)
            .bold()
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
}

#Preview {
    
    @State  var flashCards = Subject.sampleData[0].flashcards
    
    var subjects = Subject.sampleData

    @ObservedObject  var greatGreatGrandParentViewModel = SubjectViewViewModel(subjects: subjects)
    @ObservedObject  var greatGrandParentViewModel = SubjectDetailsViewViewModel(subject: greatGreatGrandParentViewModel.subjects[0], updateParent: greatGreatGrandParentViewModel.updateSubject)
   // @ObservedObject static var childViewModel = FlashCardViewViewModel(flashcards: parentViewModel.subject.flashcards,flashCardUpdateCallBack: parentViewModel.saveFlashCards)
    
    @StateObject  var grandParentViewModel = FlashCardViewViewModel(flashcards: flashCards, flashCardUpdateCallBack: greatGrandParentViewModel.saveFlashCards)
    
    @StateObject  var parentViewModel = FlashCardListViewViewModel(flashcards: grandParentViewModel.flashcards, updateParentFlashCard: grandParentViewModel.updateFlashCard)
    
    @StateObject  var viewModel = FlashCardEditViewViewModel(flashCard: parentViewModel.flashcards[0], onFlashCardUpdate: parentViewModel.onFlashCardUpdate)
    
    return  FlashCardEditViewHelper(viewModel: viewModel)
}
