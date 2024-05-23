//
//  FlashCardView2.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/20/24.
//


import SwiftUI

struct FlashCardView: View {
    
   // @StateObject var viewModel = FlashCardViewViewModel(
    //var flashCards : Flashcard
    @StateObject var viewModel: FlashCardViewViewModel
    @State var isPresenetingAddView = false
    init(flashcards: [FlashCard]) {
        self._viewModel =
        StateObject(wrappedValue:  FlashCardViewViewModel(flashcards: flashcards))
    }
    
    var body: some View{
        NavigationView{
            
            
            TabView(selection: $viewModel.selectedTab){
                cardView.tabItem {  Label("Cards", systemImage: "square.stack") }.tag(0)
                //NavigationView{
                listView.tabItem {  Label("List", systemImage: "list.bullet.rectangle.portrait") }.tag(1)
                
            }
            .id(viewModel.selectedTab)

        }
       // .navigationBarTitleDisplayMode(.inline)

        .toolbar {
            ToolbarItem {
                Button(action: {
                    viewModel.isPresentingAddView = true
                }) {
                    Image(systemName: "plus.square.on.square")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding(4)
                }
            }
        }
        .sheet(isPresented: $viewModel.isPresentingAddView) {
            FlashCardAddView()
        }
       
        

        
    }
    
    @ViewBuilder 
    var listView: some View{
        FlashCardListView(flashcards:viewModel.flashcards, updateFlashCard:
         viewModel.updateFlashCard
        )
    }
    
    @ViewBuilder var cardView: some View{
        VStack(alignment: .center, spacing: 0){
            
            //if !viewModel.isListView{
            TabView(selection: $viewModel.index, content: {
                ForEach(
                    viewModel.flashcards.indices, id: \.self,
                    content: {
                        fc_index in
                        FlashCardContentView(
                            flashCard:
                                viewModel.flashcards[fc_index],
                            updateParent:{
                                updateFlashcard in viewModel.updateFlashCard(flashcard: updateFlashcard)
                            })
                    })
            })
            
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
            .transition(.opacity) // Transition for TabView
            .animation(.easeInOut, value: viewModel.isListView)
            VStack(content: {
                FlashCardCollectionScrollView(
                    flashcards: viewModel.flashcards,
                    index: viewModel.index,
                    updateIndex:
                        {updateIndex in
                            viewModel.updateIndex(idx: updateIndex)
                        })
                .transition(.slide) // Add a sliding transition
                .animation(.easeInOut, value: viewModel.isListView)
            })
        }
    }

}

struct FlashCardView_Previews: PreviewProvider {
    
  //  @State static var flashcards = Subject.sampleData[0].flashcards
    @ObservedObject  static var viewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[0].flashcards)
    static var previews: some View {
        //FlashCardView(flashcards: $flashcards)
        NavigationStack{
            FlashCardView(flashcards: viewModel.flashcards)
            
        }
 
    }
}

