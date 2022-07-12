//
//  PageOne.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI

struct PageOne: View {
    @ObservedObject var viewModel: PageOneViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello there")
                    .font(.body)
                
                NavigationLink(isActive: $viewModel.isPresentingDetails, destination: {
                    DetailView(shouldPop: $viewModel.shouldPop)
                    
                }, label: {
                    Text("Show Details")
                })
                
                    
            }
            .navigationTitle("Page One")
        }
    }
    
}

struct PageOne_Previews: PreviewProvider {
    static var previews: some View {
        PageOne(viewModel: PageOneViewModel())
    }
}
