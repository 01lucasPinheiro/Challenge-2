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
            
            
            Image("")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture{
                    viewModel.mudarMapa()
                    
                }
                testedaChuva()
        }.background(Image("fundoTelaInicial"))
    }
}
#Preview {
    JogoChuvaView()
}
