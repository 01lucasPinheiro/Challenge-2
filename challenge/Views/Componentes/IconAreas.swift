//
//  BotaoPrincipal.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI
struct IconAreas<Destino: View>: View {
  
    var icon: String
    var radius: CGFloat = 0
    var corTextoBotao: Color
    var corBotao: Color
    var widthFrame: CGFloat = 0
    var heightFrame: CGFloat = 0
    var contornoBranco: Bool = false
    var padding: CGFloat = 0

    @State private var irParaTela = false
    
    var tela: Destino
    
    var body: some View {
        Button(action: {
            irParaTela = true
        }) {
            ZStack {
                if contornoBranco {
                    RoundedRectangle(cornerRadius: radius)
                        .frame(width: widthFrame + 5, height: heightFrame + 5)
                        .background(Color.white)
                        .cornerRadius(radius)

                }
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .padding(padding)
                  
                }
                .frame(width: widthFrame, height: heightFrame)
                .foregroundColor(corTextoBotao)
                .background(Color.botaoAzul)
                .cornerRadius(radius)
                
            }
            // Quando irParaTela for true, ele abre a variável 'tela'
            .navigationDestination(isPresented: $irParaTela) {
                tela
            }
        }
    }
}
#Preview {
    IconAreas(icon: "cloud.fill", radius: 60, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, widthFrame: 80, heightFrame: 80, contornoBranco: true, padding: 15, tela: ContentView())
}
