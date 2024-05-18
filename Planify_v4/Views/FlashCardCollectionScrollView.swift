//
//  FlashCardCollectionScrollView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/10/24.
//

import SwiftUI

struct FlashCardCollectionScrollView: View {
    
    @StateObject var viewModel            : FlashCardCollectionScrollViewViewModel
    @ObservedObject var flashCardViewModel: FlashCardViewViewModel
    
    var body: some View {
        VStack{
            
            ScrollView(.horizontal,showsIndicators: true,
                       content: {
                HStack(alignment: .center,spacing:20){
                    ForEach(0..<viewModel.titles.count,id: \.self){ fc_index in
                        Button(action: {withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.4)){
                            flashCardViewModel.changeState(state: fc_index)
                        }
                        }) {
                            Text(viewModel.titles[fc_index].front)
                                .font(.footnote)
                                .truncationMode(.tail)
                                .lineLimit(1)
                                .frame(width: 100, height: 80)
                                .padding(.horizontal)
                                .background(Color.blue.opacity(0.20))  // Background applied directly to Button
                                .cornerRadius(5)
                                .border(Color.red)
                        }
                    }
                    .foregroundColor(Color.black)
                    .background(Color.blue.opacity(0.20))
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    
                }
            })
        }
    }
}

struct FlashCardCollectionScrollView_Previews: PreviewProvider {
    @State static var index = 0
    @ObservedObject static var viewModel = FlashCardCollectionScrollViewViewModel(titles:
                                 Subject.sampleData[1].flashcards)
    
    @ObservedObject static var fcView = FlashCardViewViewModel(
        flashcards: Subject.sampleData[1].flashcards)
    
    static var previews: some View {
        FlashCardCollectionScrollView(
        viewModel:          viewModel,
        flashCardViewModel: fcView )
    }
}
