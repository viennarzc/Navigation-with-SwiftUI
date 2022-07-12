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
    
    var body: some View {
        TabView {
            PageOne()
            PageTwo(pageTwoViewModel: pageTwoViewModel)
        }
    }
}



class MainFlow {
    @Published var pageTwoVM: PageTwoViewModel
    
    init(pageTwoViewModel: PageTwoViewModel) {
        self.pageTwoVM = pageTwoViewModel
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pageTwoViewModel: PageTwoViewModel(submitViewModel: SubmitCodeViewModel()))
    }
}

struct PageOne: View {
    var body: some View {
        VStack {
            Text("Hello there")
                .font(.body)
                
        }
        .navigationTitle("Page One")
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

struct SubmitCodeView: View {
    @ObservedObject var viewModel: SubmitCodeViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter Code", text: $viewModel.textFieldValue)
            
            Button {
                viewModel.submit()
                
            } label: {
                Text("Submit")
            }

        }
    }
}


class PageTwoViewModel: ObservableObject {
    @Published var submitViewModel: SubmitCodeViewModel
    
    init(submitViewModel: SubmitCodeViewModel) {
        self.submitViewModel = submitViewModel
    }
}

struct PageTwo: View {
    @State var codeSubmitShown = false
    @ObservedObject var pageTwoViewModel: PageTwoViewModel
    
    var body: some View {
        VStack {
            Text("Hello there, It's me")
                .font(.body)
            
            Button {
                codeSubmitShown = true
            } label: {
                Text("Register")
            }
            .sheet(isPresented: $codeSubmitShown, onDismiss: {
                
            }, content: {
                SubmitCodeView(viewModel: pageTwoViewModel.submitViewModel)
            })

                
        }
        .navigationTitle("Page Two")
    }
    
}

