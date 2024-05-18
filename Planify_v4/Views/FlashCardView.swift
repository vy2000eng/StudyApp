//
//  FlashCardView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/7/24.
//

import SwiftUI

struct FlashCardView: View {
    
    @StateObject var viewModel: FlashCardViewViewModel
    
    var body: some View{
        VStack(alignment: .center, spacing: 0){
            
            if !viewModel.isListView{
                TabView(selection: $viewModel.index){
                    ForEach(viewModel.flashcards.indices,id: \.self){ fc_index in
                       // FlashCardContentView(fc_index: fc_index)
                        FlashCardContentView(fc_index: fc_index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
                .transition(.opacity) // Transition for TabView
                .animation(.easeInOut, value: viewModel.isListView)
                
                VStack(){
                    FlashCardCollectionScrollView(
                        viewModel:          FlashCardCollectionScrollViewViewModel(
                                                titles: viewModel.flashcards),
                        flashCardViewModel: viewModel
                    )
                }
                .transition(.slide) // Add a sliding transition
                .animation(.easeInOut, value: viewModel.isListView)
            }
            else{
              //  NavigationView{
                    FlashCardListView(viewModel: FlashCardListViewViewModel(flashCardViewModel: viewModel))
            //    }
                .transition(.move(edge: .bottom)) // Move in from the right
                .animation(.easeInOut, value: viewModel.isListView)
                
            }
        }.toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action:{
                    withAnimation{
                        viewModel.toggleListView()
                    }
                }) {
                    viewModel.isListView ?
                    Image(systemName: "list.bullet.rectangle.fill")
                        .font(.title2):
                    Image(systemName: "list.bullet.rectangle")
                        .font(.title2)
                }
            }
        }
        .environmentObject(viewModel)
        
        
    }
}

struct FlashCardView_Previews: PreviewProvider {
    
  //  @State static var flashcards = Subject.sampleData[0].flashcards
    @ObservedObject  static var viewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[0].flashcards)
    static var previews: some View {
        //FlashCardView(flashcards: $flashcards)
        NavigationStack{
            FlashCardView(viewModel: viewModel)
            
        }
 
    }
}
