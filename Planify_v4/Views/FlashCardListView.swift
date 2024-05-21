//
//  FlashCardListView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/12/24.
//

import SwiftUI

struct FlashCardListView: View {

    @StateObject var viewModel: FlashCardListViewViewModel
    
    init(flashcards: [FlashCard], onFlashCardUpdate: @escaping (FlashCard)->Void) {
        self._viewModel = StateObject(wrappedValue:
                                        FlashCardListViewViewModel(flashcards: flashcards,
                                                                   updateParentFlashCard: onFlashCardUpdate))
    }
    
    
    
    @State private var selectedTab = "One"
    
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.flashcards.indices,id: \.self) { fc_index in
                    Section{
                        HStack{
                            VStack(alignment: .leading){
                                Text(viewModel.flashcards[fc_index].front)
                                    .multilineTextAlignment(.leading)
                                    .bold()
                                    .font(.title3)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Text(viewModel.flashcards[fc_index].back)
                                    .multilineTextAlignment(.leading)
                                    .font(.subheadline)
                            }
                           
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title2)
                                .onTapGesture {
                                   viewModel.index = fc_index
                                    viewModel.isPresentingEditingView = true
                                   viewModel.emptyFlashCard = viewModel.flashcards[fc_index]
                              
                                }
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.isPresentingEditingView){
                NavigationView{
                    FlashCardEditView(flashCard: viewModel.emptyFlashCard, onFlashCardUpdate: viewModel.updateFlashCardCallBackFunc
                    
                    ).toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                viewModel.isPresentingEditingView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                viewModel.isPresentingEditingView = false
                            }

                        }

                    }

                }
            }
            
            
            ////
            ////
            ///
            ///
            
            ////
            ////
            ///
            ///
            
        }
    }
}

        
        
        
struct FlashCardListView_Previews: PreviewProvider {
    //    @ObservedObject static var fcView = FlashCardViewViewModel(
    //        flashcards: Subject.sampleData[1].flashcards)
    //        @StateObject static var fcViewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
    //        @ObservedObject static var viewModel = FlashCardListViewViewModel(flashCardViewModel: fcViewModel)
    @ObservedObject static var viewModel = FlashCardViewViewModel(
        flashcards: Subject.sampleData[1].flashcards)
    
    static var previews: some View {
        
        
        
          NavigationView{
        FlashCardListView(flashcards: viewModel.flashcards, onFlashCardUpdate: viewModel.updateFlashCard)
        }
        
    }
}
    
