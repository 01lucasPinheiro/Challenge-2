//
//  JogoChuvaView.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI

struct JogoChuvaView: View {
    @State private var viewModel = JogoChuvaViewModel()
    @Environment(DadosCidadeData.self) var cidadeData
    var body: some View {
        ZStack{
            Image("")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture{
                    viewModel.mudarMapa()
                    
                }
            testedaChuva(intensidadeChuva: viewModel.intensidadeChuva())
            NuvensAnimadasView(quantidade: viewModel.quantidadenuvens())

        }.background(Image("fundoTelaInicial"))
    }
}
#Preview {
    JogoChuvaView()
        .environment(DadosCidadeData())
}
