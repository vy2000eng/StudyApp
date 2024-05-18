//
//  SubjectDetailsViewViewModel.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/13/24.
//

import Foundation
import SwiftUI
//import SwiftUI


class SubjectDetailsViewViewModel: ObservableObject {
   // @Published  var subject:Subject
    @Published var subject: Subject
    var updateParent: (Subject) -> Void

    init(subject: Subject, updateParent: @escaping (Subject) -> Void) {
        self.subject = subject
        self.updateParent = updateParent
    }

    func saveChanges() {
        updateParent(subject)
    }


//    var subject:Subject
//
//    init(subject: Subject) {
//        self.subject = subject
//    }

       // self.subject = subject
    

    

    

}

