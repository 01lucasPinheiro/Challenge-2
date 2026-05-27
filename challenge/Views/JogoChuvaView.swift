//
//  JogoChuvaView.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI

struct JogoChuvaView: View {
    @State private var viewModel = JogoChuvaViewModel(indice: 0)
    @Environment(DadosCidadeData.self) var cidadeData
    var body: some View {
        ZStack(){
            Image("")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture{
                    viewModel.mudarMapa(cidadeData: cidadeData)
                    
                }
            testedaChuva(intensidadeChuva: viewModel.intensidadeChuva())
            NuvensAnimadasView(quantidade: viewModel.quantidadenuvens())
            
            VStack {
                CaixaDeTexto(index: 0)
                    .padding(250)
                Image(systemName: "hand.tap.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                Spacer()
            }
        }.background(Image("fundoTelaInicial"))
    }
    
}
#Preview {
    JogoChuvaView()
        .environment(DadosCidadeData())
}
