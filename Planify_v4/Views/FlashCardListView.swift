//
//  FlashCardListView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/12/24.
//

import SwiftUI

struct FlashCardListView: View {
    
    @StateObject var viewModel: FlashCardListViewViewModel
    @State private var isShowingDetailView = false
    
    
    init(flashcards: [FlashCard], updateFlashCard: @escaping (FlashCard)->Void) {
        self._viewModel = StateObject(wrappedValue:
                                        FlashCardListViewViewModel(flashcards: flashcards,
                                                                   updateParentFlashCard: updateFlashCard))
    }
    
    
    
    @State private var selectedTab = "One"
    
    var body: some View {
        
        
        VStack{
            List{
                ForEach(viewModel.flashcards) { $flashcard in
                    Section{
                        VStack(alignment: .leading){
                            HStack(){
                                VStack(alignment:.leading){
                                    Text(flashcard.front)
                                        .multilineTextAlignment(.leading)
                                        .bold()
                                        .font(.title3)
                                }
                                Spacer()
                                
                                VStack(alignment:.trailing){
                                    
                                    Button(action: {
                                        viewModel.index = viewModel.flashcards.firstIndex(where: { $0.id == flashcard.id }) ?? -1
                                        viewModel.isPresentingEditingView = true
                                        viewModel.edittingFlashCard = flashcard
                                        
                                    }, label: {
                                        Image(systemName: "pencil")
                                            .bold()
                                            .font(.title2)
                                    })
                                    
                                    .frame(minWidth: 10,minHeight: 10)
                                    .background( NavigationLink(destination:FlashCardEditView(flashCard: flashcard, onFlashCardUpdate:
                                                                                                {upfc in viewModel.updateFlashCardCallBackFunc(flashCard: upfc)}
                                                                                             )){
                                        EmptyView()
                                    }.opacity(0))
                                }
                            }
                        }
                        Text(flashcard.back)
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                    }
                }
            }
        }
        
        
        
    }
}
    
    
    //@ViewBuilder
//    var mainListView: some View {
//        VStack{
//            List{
//                ForEach(viewModel.flashcards) { $flashcard in
//                    Section{
//                        VStack(alignment: .leading){
//                            HStack(){
//                                VStack(alignment:.leading){
//                                    Text(flashcard.front)
//                                        .multilineTextAlignment(.leading)
//                                        .bold()
//                                        .font(.title3)
//                                }
//                                Spacer()
//                                
//                                VStack(alignment:.trailing){
//                                    
//                                    Button(action: {
//                                        viewModel.index = viewModel.flashcards.firstIndex(where: { $0.id == flashcard.id }) ?? -1
//                                        viewModel.isPresentingEditingView = true
//                                        viewModel.edittingFlashCard = flashcard
//                                        
//                                    }, label: {
//                                        Image(systemName: "pencil")
//                                            .bold()
//                                            .font(.title2)
//                                    })
//                                    
//                                    .frame(minWidth: 10,minHeight: 10)
//                                    .background( NavigationLink(destination:FlashCardEditView(flashCard: flashcard, onFlashCardUpdate:
//                                                                                                {upfc in viewModel.updateFlashCardCallBackFunc(flashCard: upfc)}
//                                                                                             )){
//                                        EmptyView()
//                                    }.opacity(0))
//                                }
//                            }
//                        }
//                        Text(flashcard.back)
//                            .multilineTextAlignment(.leading)
//                            .font(.subheadline)
//                    }
//                }
//            }
//        }
//        
//    }
//}
    
    
    

    
    
    
    
    
    
    
    
    
    
    struct FlashCardListView_Previews: PreviewProvider {
        //@ObservedObject static var fcView = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
        @StateObject static var fcViewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
        //  @ObservedObject static var viewModel = FlashCardListViewViewModel(flashCardViewModel: fcViewModel)
        
        //    @State static var index = 0
        //
        //    @ObservedObject static var viewModel = FlashCardViewViewModel(
        //        flashcards: Subject.sampleData[1].flashcards)
        
        
        static var previews: some View {
            //        FlashCardCollectionScrollView(
            //        viewModel:          viewModel,
            //        flashCardViewModel: fcView )
            NavigationStack{
                FlashCardListView(flashcards: fcViewModel.flashcards, updateFlashCard: fcViewModel.updateFlashCard)
                
                
            }
            //FlashCardCollectionScrollView(flashcards: viewModel.flashcards, index: index, updateIndex: {updateIndex in viewModel.updateIndex(idx: updateIndex)})
        }
        
        
        
    }




    
