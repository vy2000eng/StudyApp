//
//  SwiftUIView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/15/24.
//

import SwiftUI

struct FlashCardEditView: View {
       // @ObservedObject
    @StateObject var viewModel: FlashCardEditViewViewModel

    var body: some View {
        VStack(alignment: .center){
            HStack{
                Text("Term:")
                    .font(.title)
                    .underline()
                TextField("Term", text: $viewModel.editingFlashCard.front )

               // TextField("Term", text: $viewModel.fcViewModel.flashcards[viewModel.index].front )
                
            }
            HStack{
                Text("Definition:")
                    .font(.title)
                    .underline()
                TextField("Term", text: $viewModel.editingFlashCard.back )


               // TextField("Definition", text: $viewModel.fcViewModel.flashcards[viewModel.index].back )
                
            }
           
         //   TextField("term", text: $viewModel.fcViewModel. )
            
        }
    
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    
    @StateObject static var fcViewModel = FlashCardViewViewModel(flashcards: Subject.sampleData[1].flashcards)
    
   // @ObservedObject static var viewModel = FlashCardEditViewViewModel(fcViewModel: fcViewModel,index:0)
    
    static var previews: some View {
        FlashCardEditView(viewModel: FlashCardEditViewViewModel(editingFlashCard: fcViewModel.flashcards[0]))
    }
}
