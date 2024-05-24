//
//  FlashCardCollectionScrollView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/10/24.
//

import SwiftUI

struct FlashCardCollectionScrollView: View {
    
    @StateObject var viewModel: FlashCardCollectionScrollViewViewModel
    init(flashcards:[FlashCard],index:Int ,updateIndex: @escaping(Int)->Void){
        self._viewModel = StateObject(wrappedValue: FlashCardCollectionScrollViewViewModel(titles: flashcards, index: index,updateIndex: updateIndex))
        
    }
    
    var body: some View {
        VStack{
            
            ScrollView(.horizontal,showsIndicators: true,
                       content: {
                HStack(alignment: .center,spacing:20){
                    ForEach(0..<viewModel.titles.count,id: \.self){ fc_index in
                        Button(action: {withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.4)){
                            viewModel.updateIdx(index: fc_index)
                        }
                        }) {
                            Text(viewModel.titles[fc_index].front)
                                .font(.footnote)
                                .truncationMode(.tail)
                                .lineLimit(1)
                                .frame(width: 100, height: 80)
                                .padding(.horizontal)
                                .background(Color.blue.opacity(0.20))  // Background applied directly to Button
                                .cornerRadius(5)
                                .border(Color.red)
                        }
                    }
                    .foregroundColor(Color.black)
                    .background(Color.blue.opacity(0.20))
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    
                }
            })
        }
    }
}

struct FlashCardCollectionScrollView_Previews: PreviewProvider {
    @State static var index = 0

    
    
    static var subjects = Subject.sampleData

    @ObservedObject static var grandParentViewModel = SubjectViewViewModel(subjects: subjects)
    @ObservedObject static var parentViewModel = SubjectDetailsViewViewModel(subject: grandParentViewModel.subjects[0], updateParent: grandParentViewModel.updateSubject)
    @ObservedObject static var childViewModel = FlashCardViewViewModel(flashcards: parentViewModel.subject.flashcards,flashCardUpdateCallBack: parentViewModel.saveFlashCards)
    
    
//    @ObservedObject static var viewModel = FlashCardViewViewModel(
//        flashcards: Subject.sampleData[1].flashcards)
    
    
    static var previews: some View {

        FlashCardCollectionScrollView(flashcards: childViewModel.flashcards, index: index, updateIndex: childViewModel.updateIndex)
    }
}
