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
    
    var body: some View {
        FlashCardEditViewHelper(viewModel: viewModel)
    }
}
    
    
struct FlashCardEditView_Previews: PreviewProvider {
    static var subjects = Subject.sampleData

    @ObservedObject static var grandParentViewModel = SubjectViewViewModel(subjects: subjects)
    @ObservedObject static var parentViewModel = SubjectDetailsViewViewModel(subject: grandParentViewModel.subjects[0], updateParent: grandParentViewModel.updateSubject)
   // @ObservedObject static var childViewModel = FlashCardViewViewModel(flashcards: parentViewModel.subject.flashcards,flashCardUpdateCallBack: parentViewModel.saveFlashCards)
    
    @ObservedObject static var fcVm = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards,flashCardUpdateCallBack:  parentViewModel.saveFlashCards)
    @ObservedObject static var vm = FlashCardListViewViewModel(flashcards:Subject.sampleData[1].flashcards,updateParentFlashCard: {updatefc in fcVm.updateFlashCard(flashcard: updatefc)});
    
    
    static var previews: some View {
        let sampleFlashcards = Subject.sampleData[1].flashcards
        let fcVm = FlashCardViewViewModel(flashcards: sampleFlashcards, flashCardUpdateCallBack: parentViewModel.saveFlashCards)
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

