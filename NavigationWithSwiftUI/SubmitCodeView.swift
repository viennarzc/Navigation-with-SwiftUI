//
//  SubmitCodeView.swift
//  NavigationWithSwiftUI
//
//  Created by Viennarz Curtiz on 7/12/22.
//

import SwiftUI

struct SubmitCodeView: View {
    @ObservedObject var viewModel: SubmitCodeViewModel
    
    var body: some View {
        Form() {
            Section {
                
                
                TextField("Enter Code", text: $viewModel.textFieldValue)
                    .textFieldStyle(.plain)
                
                Button {
                    viewModel.submit()
                    
                } label: {
                    Text("Submit")
                }
            } footer: {
                Text("Type AB for success")
            }

        }
    }
}

struct SubmitCodeView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitCodeView(viewModel: SubmitCodeViewModel())
    }
}
