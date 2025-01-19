//
//  MVVMView.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import SwiftUI

struct MVVMSwiftUIView: View {
    @ObservedObject var viewModel: MVVMSviftUIViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.text)
                .font(.headline)
        }
    }
}

struct MVVMView_Previews: PreviewProvider {
    static var previews: some View {
        MVVMSwiftUIView(viewModel: MVVMSviftUIViewModel(userService: UserServiceStub()))
    }
}
