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
    
    
    var nuvensBrilho: Double {
        switch cidadeData.umidade {
        case 0:
            return 0
        case 0.25:
            return -0.1
        case 0.5:
            return -0.15
        case 0.75:
            return -0.25
        case 1:
            return -0.3
        default:
            return 0
        }
    }
    
    var body: some View {
        
  
        
        GeometryReader { geometry in
            ZStack(alignment: .top) { 
                
                if viewModel.quantidadenuvens() == 8 {
                    EfeitoRaioTela()
                }
                
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
               // EfeitoRaioTela()
               
                
                testedaChuva(intensidadeChuva: viewModel.intensidadeChuva(), geo: geometry)
                
                NuvensAnimadasView(quantidade: viewModel.quantidadenuvens(), geoWidth: geometry.size.width, brigthnessCloud: nuvensBrilho)
               // NuvensAnimadas
                
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
        }.background(Image("fundoTelaInicial")
            .brightness(nuvensBrilho))
    }
}
#Preview {
    JogoChuvaView()
        .environment(DadosCidadeData())
}
