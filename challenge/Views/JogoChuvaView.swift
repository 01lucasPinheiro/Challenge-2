//
//  JogoChuvaView.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI

struct JogoChuvaView: View {
    @State private var viewModel = JogoChuvaViewModel()
    var body: some View {
        ZStack{
            
            
            Image(viewModel.mapaAtual())
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture{
                    viewModel.mudarMapa()
                    
                }
                testedaChuva()
        }
    }
}
#Preview {
    JogoChuvaView()
}
