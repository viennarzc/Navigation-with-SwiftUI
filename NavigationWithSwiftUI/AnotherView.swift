//
//  AnotherView.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI

struct AnotherView: View {
    var onTappedPop: () -> Void
    
    var body: some View {
        Form {
            Text("Lorem ipsum")
            
            Button {
                onTappedPop()
                
            } label: {
                Text("Pop to root")
            }

        }
        .navigationTitle("Another View")
    }
}

struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView(onTappedPop: { })
    }
}
