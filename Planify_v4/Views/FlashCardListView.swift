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
    
    var body: some View{
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
        }
    }
}
struct FlashCardListView_Previews: PreviewProvider {
    @StateObject static var fcViewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
    static var previews: some View {
        NavigationView{
            FlashCardListView(flashcards: fcViewModel.flashcards, updateFlashCard: fcViewModel.updateFlashCard)
        }
    }
}

