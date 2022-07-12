//
//  PageOne.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI


class PageOneViewModel: ObservableObject {
    @Published var isPresentingDetails: Bool = false
    @Published var shouldPop: Bool = false
}

struct PageOne: View {
    @ObservedObject var viewModel: PageOneViewModel
    var gotoTab2: () -> Void
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Hello there")
                    .font(.body)
                
                NavigationLink(isActive: $viewModel.isPresentingDetails, destination: {
                    DetailView(shouldPop: $viewModel.shouldPop)
                    
                }, label: {
                    Text("Show Details")
                })
                
                
                Button {
                    gotoTab2()
                } label: {
                    Text("Go to Tab Page 2")
                }

                    
            }
            .navigationTitle("Page One")
        }
    }
    
}

struct PageOne_Previews: PreviewProvider {
    static var previews: some View {
        PageOne(viewModel: PageOneViewModel(), gotoTab2: {})
    }
}
