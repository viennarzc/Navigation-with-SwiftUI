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

struct SubmitCodeView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitCodeView(viewModel: SubmitCodeViewModel())
    }
}
