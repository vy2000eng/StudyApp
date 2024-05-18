//
//  FlashCardListView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/12/24.
//

import SwiftUI

struct FlashCardListView: View {
    // @Binding var flashcards: [FlashCard]
    //@ObservedObject var viewModel:FlashCardCollectionScrollViewViewModel
    
    // @StateObject var viewModel            : FlashCardCollectionScrollViewViewModel
    // @ObservedObject var flashCardViewModel: FlashCardViewViewModel
    @StateObject var viewModel: FlashCardListViewViewModel
    @State  var index = 0
    @State var isPresentingEditView = false
    
    
    @State private var selectedTab = "One"
    
    var body: some View {
        VStack{
            List{
                ForEach(viewModel.flashCardViewModel.flashcards.indices,id: \.self) { fc_index in
                    Section{
                        HStack{
                            VStack(alignment: .leading){
                                Text(viewModel.flashCardViewModel.flashcards[fc_index].front)
                                    .multilineTextAlignment(    .leading)
                                    .bold()
                                    .font(.title3)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Text(viewModel.flashCardViewModel.flashcards[fc_index].back)
                                    .multilineTextAlignment(    .leading)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title2)
                                .onTapGesture {
                                    index = fc_index
                                    isPresentingEditView = true
                                    viewModel.editingFlashCard =
                                    viewModel.flashCardViewModel.flashcards[index]
                                    
                                }
                        }
                    }
                }
            }
            
            .sheet(isPresented: $isPresentingEditView){
                NavigationView{
                    FlashCardEditView(viewModel: FlashCardEditViewViewModel(editingFlashCard:          viewModel.flashCardViewModel.flashcards[index]
                                                                           ))
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
//                                    viewModel.flashCardViewModel.flashcards[index] = viewModel.editingFlashCard
                                }
                            }
                            
                            
                            
                            
                        }
                    
                }
                
                
                
            }
            
        }
    }
    
    struct FlashCardListView_Previews: PreviewProvider {
        //    @ObservedObject static var fcView = FlashCardViewViewModel(
        //        flashcards: Subject.sampleData[1].flashcards)
        @StateObject static var fcViewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
        @ObservedObject static var viewModel = FlashCardListViewViewModel(flashCardViewModel: fcViewModel)
        static var previews: some View {
            
            
            
            //  NavigationView{
            FlashCardListView(viewModel: viewModel)
            
            // }
            
        }
    }
}
