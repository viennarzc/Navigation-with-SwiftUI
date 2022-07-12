//
//  PageTwo.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI

struct PageTwo: View {
    
    @ObservedObject var pageTwoViewModel: PageTwoViewModel
    
    var body: some View {
        VStack {
            Text("Hello there, It's me")
                .font(.body)
            
            Button {
                pageTwoViewModel.isSubmitCodePresented = true
            } label: {
                Text("Register")
            }
            .sheet(isPresented: $pageTwoViewModel.isSubmitCodePresented, onDismiss: {
                
            }, content: {
                SubmitCodeView(viewModel: pageTwoViewModel.submitViewModel)
            })

                
        }
        .navigationTitle("Page Two")
    }
    
}
struct PageTwo_Previews: PreviewProvider {
    static var previews: some View {

        PageTwo(pageTwoViewModel: PageTwoViewModel(submitViewModel: SubmitCodeViewModel()))
    }
}
