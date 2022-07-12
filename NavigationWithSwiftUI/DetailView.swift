//
//  DetailView.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI

struct DetailView: View {
    @State var isPresentingAnother: Bool = false
    @Binding var shouldPop: Bool
    
    var body: some View {
        VStack {
            Text("Lorem ipsum")
            
            NavigationLink(isActive: $isPresentingAnother, destination: {
                AnotherView(onTappedPop: {
                    shouldPop = true
                })
                
            }, label: {
                Text("test")
            })
        }
        .navigationTitle("Detail View")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(shouldPop: .constant(false))
    }
}
