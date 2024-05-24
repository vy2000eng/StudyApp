//
//  FlashCardView2.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/20/24.
//


import SwiftUI


struct FlashCardView: View {

    @StateObject var viewModel: FlashCardViewViewModel
    @State var isPresenetingAddView = false
    init(flashcards: [FlashCard], onFlashCardsUpdate: @escaping ([FlashCard])->Void) {
        self._viewModel =
        StateObject(wrappedValue: 
                        FlashCardViewViewModel(flashcards: flashcards, flashCardUpdateCallBack: onFlashCardsUpdate)
        )
    }
    
    
    /// the helpers are just here to minimize clutters
    var body: some View{
        
        FlashCardViewHelper(viewModel: viewModel)
    }

}

struct FlashCardView_Previews: PreviewProvider {
    
    static var subjects = Subject.sampleData
    
    @ObservedObject static var grandParentViewModel = SubjectViewViewModel(subjects: subjects)
    @ObservedObject static var parentViewModel = SubjectDetailsViewViewModel(subject: grandParentViewModel.subjects[0], updateParent: grandParentViewModel.updateSubject)
    //@StateObject  static var viewModel = FlashCardViewViewModel(flashcards: parentViewModel.subject, flashCardUpdateCallBack: parentViewModel.updateSubject)
    static var previews: some View {
        NavigationStack{
            FlashCardView(flashcards: parentViewModel.subject.flashcards, onFlashCardsUpdate: parentViewModel.saveFlashCards)
        }
    }
}

