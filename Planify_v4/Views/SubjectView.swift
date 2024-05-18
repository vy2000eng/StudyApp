//
//  SubjectView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//


//   SubjectDetailsView(viewModel: SubjectDetailsViewViewModel(subject: subject, svViewModel: viewModel))){
//     Text(subject.title)
//}
import SwiftUI

struct SubjectView: View {
    
    @ObservedObject var viewModel: SubjectViewViewModel
    @State var idx = 0
    
    var body: some View
    {
        NavigationStack{
            
            
            VStack(alignment: .leading)
            {
                List{
                    Section{
                        ForEach($viewModel.subjects.indices,id: \.self)
                        {
                            subjectIndex in
                            NavigationLink(destination:
                                            SubjectDetailsView(subject: viewModel.subjects[subjectIndex],
                                                               updateParent:
                                                                            { updatedSubject in
                                                                                viewModel.updateSubject(subject: updatedSubject)})
                            ){
                               // viewModel.updateIndex(index: subjectIndex)
                                //viewModel.index = subjectIndex
                                Text(viewModel.subjects[subjectIndex].title)
                                
                                    
                                }


                        }
                        
                    }//Section
                }.navigationTitle("Subjects")
                
            }
        }
    }
    //Vstack
}//var body

struct SubjectView_Previews: PreviewProvider {
    @StateObject static var vm = SubjectViewViewModel(subjects: Subject.sampleData)
    
    static var previews: some View {
       // NavigationView{
            SubjectView(viewModel:vm)

    }
}
