//
//  SubjectDetailsView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//

import SwiftUI

struct SubjectDetailsView: View {
    var viewModel : SubjectDetailsViewViewModel
    
    init(subject: Subject, updateParent: @escaping (Subject) -> Void) {
        self.viewModel = SubjectDetailsViewViewModel(subject: subject, updateParent: updateParent)
    }
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    List{
                        Section{
                            NavigationLink(destination: FlashCardView(flashcards: viewModel.subject.flashcards)){
                                Text("Flashcards")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.bold)
                            }
                            Section(header:Text("map")){
                                Text(viewModel.subject.map.title)
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                    .fontWeight(.bold)
                            }
                        }
                    }.navigationTitle(viewModel.subject.title)
                }
            }
        }
    }
    struct SubjectDetailsView_Previews: PreviewProvider {
        
        @ObservedObject static var subjectViewModel = SubjectViewViewModel(subjects: Subject.sampleData)
        static var previews: some View {

            NavigationStack{
                SubjectDetailsView(subject: subjectViewModel.subjects[0],
                                   updateParent: { updatedSubject in
                                                    subjectViewModel.updateSubject(subject: updatedSubject)
                                                })
            }
        }
    }
}
