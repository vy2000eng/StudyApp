//
//  FlashCardContentView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/10/24.
//

import SwiftUI

struct FlashCardContentView: View {
//    var flashcard: FlashCard
//    @State private var isShowingFront = true
   // @StateObject var viewModel: FlashCardContentViewViewModel
    @EnvironmentObject var fcViewModel: FlashCardViewViewModel
    @State var fc_index:Int
    
    
    var body: some View {
        VStack {
//            Text("Hello")
//            if viewModel.flashcards[fc_index] .isShowingFront {
//                Text("Term")
//                    .font(.title2)
//                    .foregroundColor(.white)
//                Text(viewModel.flashcard.front)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            } else {
//                Text("Definition")
//                    .font(.title2)
//                    .foregroundColor(.white)
//                Text(viewModel.flashcard.back)
//                    .font(.title)
//                    .fontWeight(.semibold)
//            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: 400, minHeight: 100, idealHeight: 150, maxHeight: 300, alignment: .center)
        .background(Color.blue.opacity(0.3))
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(.horizontal)
        .onTapGesture {
            //viewModel.flashcard.f
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.4)) {
                //viewModel.toggleIsShowingFront()
            }
        }
        
       
        
    }
}


struct FlashCardContentView_Previews: PreviewProvider {
   // @State static var fc = Subject.sampleData[0].flashcards[0]
    //@State static var frontBack = true
//    @ObservedObject static var viewModel = FlashCardContentViewViewModel(flashcard: Subject.sampleData[0].flashcards[0])
    
    static var previews: some View {
        FlashCardContentView(fc_index: 0)
           // .background(Color.green.opacity(0.3))
            //.previewLayout(.fixed(width: 400, height: 60))

    }
}
