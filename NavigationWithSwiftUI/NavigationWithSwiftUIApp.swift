//
//  NavigationWithSwiftUIApp.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI
import Combine

class MainTabViewModel: ObservableObject {
    enum Tab: Int, Identifiable, CaseIterable {
        var id: Int { rawValue }
        
        case pageOne
        case pageTwo
    }
    
    @Published var selectedTab: Tab = .pageOne
    
    @Published var pageTwoViewModel = PageTwoViewModel(submitViewModel: SubmitCodeViewModel())
    @Published var pageOneViewModel = PageOneViewModel()

    
    init() {
     
    }
}

let mainTabViewModel = MainTabViewModel()

@main
struct NavigationWithSwiftUIApp: App {
    let mainFlow = MainFlow(pageTwoViewModel: mainTabViewModel.pageTwoViewModel, pageOneVM: mainTabViewModel.pageOneViewModel, mainTabModel: mainTabViewModel)
    
    var body: some Scene {
        WindowGroup {
            ContentView(pageTwoViewModel: mainTabViewModel.pageTwoViewModel, pageOneViewModel: mainTabViewModel.pageOneViewModel, tabViewModel: mainTabViewModel)
        }
    }
}
