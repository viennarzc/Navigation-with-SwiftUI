//
//  NavigationWithSwiftUIApp.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI
import Combine

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
