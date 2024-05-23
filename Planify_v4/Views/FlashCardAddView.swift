//
//  FlashCardAddView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/22/24.
//

import SwiftUI

struct FlashCardAddView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var flashcard = FlashCard()
    @State var isEditingFront = false
    @State var isEditingBack = false
    
    
    
    var body: some View {
        Form{
            if !isEditingFront{
                TextField(text:$flashcard.front, label: {
                    Text("Term")
                })
                .onChange(of: flashcard.front) { newValue in
                    isEditingFront = true
                }
            }else{
                TextEditor(text: $flashcard.front)
            }
            if !isEditingBack{
                TextField(text:$flashcard.back, label: {
                    Text("Defintion")
                })
                .onChange(of: flashcard.back) { newValue in
                    isEditingBack = true
                }
            }else{
                TextEditor(text: $flashcard.back)
            }
            
            Button(action: {
                isEditingBack = false
                isEditingFront = false
                dismiss()
            },
                   label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.blue)
                    Text("save")
                        .foregroundColor(Color.white)
                        .bold()
                }
            })
        }
    }
}

#Preview {
    NavigationView{
        FlashCardAddView()

        
    }
}
