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
    init(flashcards: [FlashCard]) {
        self._viewModel =
        StateObject(wrappedValue:  FlashCardViewViewModel(flashcards: flashcards))
    }
    
    
    /// the helpers are just here to minimize clutters
    var body: some View{
        
        FlashCardViewHelper(viewModel: viewModel)
    }

}

struct FlashCardView_Previews: PreviewProvider {
    
    @ObservedObject  static var viewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[0].flashcards)
    static var previews: some View {
        NavigationStack{
            FlashCardView(flashcards: viewModel.flashcards)
        }
    }
}

