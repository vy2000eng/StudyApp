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
    @Published var subject: Subject
    var updateParent: (Subject) -> Void
    


    init(subject: Subject, updateParent: @escaping (Subject) -> Void) {
        self.subject = subject
        self.updateParent = updateParent
    }

    func saveChanges() {
        updateParent(subject)
    }

    func saveFlashCards(flashcards: [FlashCard]){
        subject.flashcards = flashcards
        
    }

    

    

}

