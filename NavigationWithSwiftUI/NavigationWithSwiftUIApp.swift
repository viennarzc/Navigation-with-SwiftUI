//
//  NavigationWithSwiftUIApp.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI
import Combine

class MainTabViewModel: ObservableObject {
    @Published var pageTwoViewModel = PageTwoViewModel(submitViewModel: SubmitCodeViewModel())
    
    var cancellable: AnyCancellable? = nil
    
    init() {
        cancellable = pageTwoViewModel.submitViewModel.$isSuccess.removeDuplicates().sink { b in
            print(b)
        }
    }
}

let mainTabViewModel = MainTabViewModel()

@main
struct NavigationWithSwiftUIApp: App {
    let mainFlow = MainFlow(pageTwoViewModel: mainTabViewModel.pageTwoViewModel)
    
    var body: some Scene {
        WindowGroup {
            ContentView(pageTwoViewModel: mainTabViewModel.pageTwoViewModel)
        }
    }
}
