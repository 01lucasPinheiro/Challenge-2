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
    @State private var pulsar: Bool = false
    @State var indicadorClique = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) { 
                
                Image("")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea()
                    .onTapGesture {
                        viewModel.mudarMapa(cidadeData: cidadeData)
                        
                        if indicadorClique{
                            withAnimation(.easeInOut){
                                indicadorClique = false
                            }
                        }
                    }
                EfeitoRaioTela()
               
                
                testedaChuva(intensidadeChuva: viewModel.intensidadeChuva(), geo: geometry)
                
                NuvensAnimadasView(quantidade: viewModel.quantidadenuvens(), geoWidth: geometry.size.width)
                
                VStack() {
                    CaixaDeTexto(index: 0)
                        .padding(.top, 100)
                    Spacer()
                    if indicadorClique {
                        Image(systemName: "hand.tap.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .scaleEffect(pulsar ? 1.50 : 1.0)
                        
                      


                    }
                       Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            }
        }.background(Image("fundoTelaInicial"))
    }
}
#Preview {
    JogoChuvaView()
        .environment(DadosCidadeData())
}
