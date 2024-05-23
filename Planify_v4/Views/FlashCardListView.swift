//
//  FlashCardListView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/22/24.
//

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
    
    
    
    // @State private var selectedTab = "One"
    
    
    
    var body: some View{
        
        //VStack{
       // NavigationView{
            List{
                ForEach( $viewModel.flashcards, id: \.id) { $flashcard in
                    Section{
                        VStack(alignment: .leading){
                            HStack{
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
                                                                                                viewModel.updateFlashCardCallBackFunc
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
          //  }
      

           // }
     
            //.navigationViewStyle() // This sets the navigation view to a specific style that might behave more consistently.
            
            //.navigationBarTitle( displayMode: .inline)
//            .navigationBarItems(trailing:
//                                    Button(action: {
//                viewModel.isPresentingAddView = true
//            }) {
//                Image(systemName: "plus.square.on.square").font(.title2)
//            })
//            .edgesIgnoringSafeArea(.top)
//            .sheet(isPresented: $viewModel.isPresentingAddView) {
//                                       FlashCardAddView()
//                //                    }
//                //            .toolbar {
//                //                        ToolbarItem(placement: .navigationBarTrailing) {
//                //                            Button(action: {
//                //                                viewModel.isPresentingAddView = true
//                //                            }) {
//                //                                Image(systemName: "plus.square.on.square")
//                //                                    .font(.title2)
//                //                                    .foregroundColor(.blue)
//                //                                    .padding(4)
//                //                            }
//                //                        }
//                //                    }
//                //                    .sheet(isPresented: $viewModel.isPresentingAddView) {
//                //                        FlashCardAddView()
//                //                    }
//                
//            }
            
        }    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
            NavigationView{
                FlashCardListView(flashcards: fcViewModel.flashcards, updateFlashCard: fcViewModel.updateFlashCard)
                
                
            }
            //FlashCardCollectionScrollView(flashcards: viewModel.flashcards, index: index, updateIndex: {updateIndex in viewModel.updateIndex(idx: updateIndex)})
        }
        
        
        
    }
    
    
    
    
    
}
