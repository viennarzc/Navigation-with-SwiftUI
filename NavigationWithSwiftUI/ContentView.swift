//
//  ContentView.swift
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

struct ContentView: View {
    
    @ObservedObject var pageTwoViewModel: PageTwoViewModel
    @ObservedObject var pageOneViewModel: PageOneViewModel
    @ObservedObject var tabViewModel: MainTabViewModel
    
    var body: some View {
        TabView(selection: $tabViewModel.selectedTab) {
            PageOne(viewModel: pageOneViewModel, gotoTab2: {
                tabViewModel.selectedTab = .pageTwo
            })
                .tag(MainTabViewModel.Tab.pageOne)
                .tabItem {
                    Text("Page 1")
                }
            PageTwo(pageTwoViewModel: pageTwoViewModel)
                .tag(MainTabViewModel.Tab.pageTwo)
                .tabItem {
                    Text("Page 2")
                }
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
        
        pageTwoVM.submitViewModel.$isSuccess.sink { [weak self ] b in
            print(b)
            self?.pageTwoVM.isSubmitCodePresented = false
        }
        .store(in: &observers)
        
        pageOneVM.$isPresentingDetails.removeDuplicates().sink { isPresenting in
            print("is presenting details\(isPresenting)")
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



