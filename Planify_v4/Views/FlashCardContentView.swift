//
//  FlashCardContentView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/10/24.
//

import SwiftUI

struct FlashCardContentView: View {

     @StateObject var viewModel:FlashCardContentViewViewModel
    init(flashCard: FlashCard, updateParent: @escaping (FlashCard) -> Void) {
        self._viewModel = StateObject(wrappedValue:FlashCardContentViewViewModel(
            flashcard: flashCard,
            updateParent: updateParent))
    }
    
    var body: some View {
        VStack {
            if viewModel.isShowingFront {
                Text("Term")
                    .font(.title2)
                    .foregroundColor(.white)
                Text(viewModel.flashcard.front)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
            } else {
                Text("Definition")
                    .font(.title2)
                    .foregroundColor(.white)
                Text(viewModel.flashcard.back)
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: 400, minHeight: 100, idealHeight: 150, maxHeight: 300, alignment: .center)
        .background(Color.blue.opacity(0.3))
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(.horizontal)
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.4)) {
                viewModel.toggleIsShowingFront()
            }
            
        }
        
       
        
    }
}


struct FlashCardContentView_Previews: PreviewProvider {
    
    
    static var subjects = Subject.sampleData

    @ObservedObject static var grandParentViewModel = SubjectViewViewModel(subjects: subjects)
    @ObservedObject static var parentViewModel = SubjectDetailsViewViewModel(subject: grandParentViewModel.subjects[0], updateParent: grandParentViewModel.updateSubject)
    @ObservedObject static var childViewModel = FlashCardViewViewModel(flashcards: parentViewModel.subject.flashcards,flashCardUpdateCallBack: parentViewModel.saveFlashCards)
    
    
    static var previews: some View {
        FlashCardContentView(flashCard: childViewModel.flashcards[0],
                             updateParent:
            childViewModel.updateFlashCard)
    }
}
