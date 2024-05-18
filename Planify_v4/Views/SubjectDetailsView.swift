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
        // self.viewModel = SubjectDetailsViewModel(subject: subject, updateParent: updateParent)
        self.viewModel = SubjectDetailsViewViewModel(subject: subject, updateParent: updateParent)
    }
//    @Binding var subject : Subject
//    @StateObject var vm : SubjectDetailsViewViewModel
//
//    init(subject :Binding< Subject>) {
//       // self.subject = subject
//        self._vm = StateObject(wrappedValue:
//                                SubjectDetailsViewViewModel(subject: subject))
//
//
//
//
//    }
    
  
    //@StateObject var ViewModel =  SubjectDetailsViewViewModel(subject: subject)
    

    
    var body: some View {
        VStack{
            
                        HStack{
                            VStack{
                                List{
                                   
                                    
                                    Section{
                                        NavigationLink(destination: FlashCardView(viewModel:  FlashCardViewViewModel(flashcards: viewModel.subject.flashcards))){
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
//
                                }
//                                .navigationTitle(viewModel.subject.title)
//                               .onTapGesture {
//                                       subject.title = "Hello"
//                                   }
//
                                .navigationTitle(viewModel.subject.title)
//                                .onTapGesture {
//                                    
//                                    viewModel.subject.title = "Hello"
//                                    viewModel.saveChanges()
//                                    //viewModel.changeSubjectTitle(title: "Hello")
//                                    //viewModel.subject.title = "Hello"
//                                    }
                            }
                        }
                    }
        }
    
    
    struct SubjectDetailsView_Previews: PreviewProvider {
        
        
        @ObservedObject static var subjectViewModel = SubjectViewViewModel(subjects: Subject.sampleData)
        
       // @StateObject static var viewModel = SubjectDetailsViewViewModel(subject: Subject.sampleData[0], svViewModel: subjectViewModel  )

        
        static var previews: some View {
//            NavigationStack{
//                SubjectDetailsView(subject:  $subjectViewModel.subjects[0])
//
//
//            }
            
            NavigationStack{
                SubjectDetailsView(subject: subjectViewModel.subjects[0],     updateParent:
                                    { updatedSubject in
                                        subjectViewModel.updateSubject(subject: updatedSubject)} )
                ///SubjectDetailsView(viewModel: SubjectDetailsViewViewModel(subject:Subject.sampleData[0] , svViewModel: subjectViewModel))


            }
        }
    }
}
