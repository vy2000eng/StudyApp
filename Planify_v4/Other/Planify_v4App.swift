//
//  Planify_v4App.swift
//  Planify_v4
//
//  Created by VladyslavYatsuta on 5/2/24.
//

import SwiftUI

@main
struct Planify_v4App: App {
    @StateObject var viewModel = SubjectViewViewModel(subjects: Subject.sampleData)
    
    var body: some Scene {
        WindowGroup {
            //NavigationView{
                SubjectView(viewModel: viewModel)
            //}
        }
    }
}
