//
//  SubjectViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//

import Foundation

class SubjectViewViewModel: ObservableObject{
    @Published var subjects: [Subject]
    @Published var index:Int
    
    init(subjects: [Subject], index:Int = 0) {
        self.subjects = subjects
        self.index = index
    }
    
    func updateIndex(updatedIndex:Int){
        index = updatedIndex
    }
    
    func updateSubject(subject: Subject) {
           if let index = subjects.firstIndex(where: { $0.id == subject.id }) {
               subjects[index] = subject
           }
       }
    

}
