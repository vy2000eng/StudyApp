//
//  SubjectView.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//



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
                        ForEach($viewModel.subjects)
                        {
                            $subject in
                            NavigationLink(destination:
                                            SubjectDetailsView(subject: subject,
                                                               updateParent:
                                                                            { updatedSubject in
                                                                                viewModel.updateSubject(subject: updatedSubject)})
                            ){
                               // viewModel.updateIndex(index: subjectIndex)
                                //viewModel.index = subjectIndex
                                Text(subject.title)
                                
                                    
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
