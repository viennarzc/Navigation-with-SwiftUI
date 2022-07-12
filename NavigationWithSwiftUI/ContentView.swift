//
//  ContentView.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var pageTwoViewModel: PageTwoViewModel
    @ObservedObject var pageOneViewModel: PageOneViewModel
    @ObservedObject var tabViewModel: MainTabViewModel
    
    var body: some View {
        TabView(selection: $tabViewModel.selectedTab) {
            PageOne(viewModel: pageOneViewModel)
                .tag(MainTabViewModel.Tab.pageOne)
            PageTwo(pageTwoViewModel: pageTwoViewModel)
                .tag(MainTabViewModel.Tab.pageTwo)
        }
        
    }
}



class MainFlow {
    @Published var pageTwoVM: PageTwoViewModel
    @Published var pageOneVM: PageOneViewModel
    @Published var mainTabModel: MainTabViewModel
    
    var observers: [AnyCancellable] = []
    
    init(pageTwoViewModel: PageTwoViewModel, pageOneVM: PageOneViewModel, mainTabModel: MainTabViewModel) {
        self.pageTwoVM = pageTwoViewModel
        self.pageOneVM = pageOneVM
        self.mainTabModel = mainTabModel
        
        pageTwoVM.submitViewModel.$isSuccess.removeDuplicates().sink { [weak self ] b in
            print(b)
            self?.pageTwoVM.isSubmitCodePresented = false
        }
        .store(in: &observers)
        
        pageOneVM.$isPresentingDetails.removeDuplicates().sink { isPresenting in
            print("is presenting \(isPresenting)")
        }
        .store(in: &observers)
        
        pageOneVM.$shouldPop.sink { pop in
            if pop {
                pageOneVM.isPresentingDetails = false
                
            }
        }
        .store(in: &observers)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pageTwoViewModel: PageTwoViewModel(submitViewModel: SubmitCodeViewModel()), pageOneViewModel: PageOneViewModel(), tabViewModel: MainTabViewModel())
    }
}

class PageOneViewModel: ObservableObject {
    @Published var isPresentingDetails: Bool = false
    @Published var shouldPop: Bool = false
}



class SubmitCodeViewModel: ObservableObject {
    @Published var isSuccess: Bool = false
    @Published var textFieldValue = ""
    
    let code = "AB"
    
    func submit() {
        if code == textFieldValue {
            isSuccess = true
        }
    }
}


class PageTwoViewModel: ObservableObject {
    @Published var submitViewModel: SubmitCodeViewModel
    @Published var isSubmitCodePresented = false
    
    init(submitViewModel: SubmitCodeViewModel) {
        self.submitViewModel = submitViewModel
    }
}


