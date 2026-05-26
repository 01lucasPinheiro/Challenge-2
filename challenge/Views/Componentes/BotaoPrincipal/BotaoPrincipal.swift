//
//  BotaoPrincipal.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI
struct ButtonsComponent<Destino: View>: View {
    
    let botao: BotaoPrincipalClasse
    @State private var irParaTela = false
    var tela: Destino
    
    var body: some View {
        Button(action: {
            irParaTela = true
        }) {
            ZStack {
                if botao.contornoBranco {
                    RoundedRectangle(cornerRadius: botao.radius)
                        .frame(width: botao.widthFrame + 7, height: botao.heightFrame + 7)
                        .background(Color.white)
                        .cornerRadius(botao.radius)

                }
                HStack {
                    if botao.mostrarIcon {
                        Image(systemName: botao.icon)
                            .resizable()
                            .padding(20)
                    }
                    
                    if botao.mostrarTexto {
                        Text(botao.textoBotao)
                            .font(.system(size: 20, weight: .bold)) // Peso da fonte aqui
                    }
                }
                .frame(width: botao.widthFrame, height: botao.heightFrame)
                .foregroundColor(botao.corTextoBotao)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: botao.corBotao, location: 0.0),
                            Gradient.Stop(color: botao.corBotaoGradiente, location: 3),
                            ],
                            
                        startPoint: .top,
                        endPoint: .bottom,
                    )
                )
                .cornerRadius(botao.radius)
                
            }
            // Quando irParaTela for true, ele abre a variável 'tela'
            .navigationDestination(isPresented: $irParaTela) {
                tela
            }
        }
    }
}
//#Preview {
 //   ButtonsComponent(mostrarIcon: false, mostrarTexto: true, icon: "icloud.fill", textoBotao: "Iniciar", radius: 30, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, corBotaoGradiente: .azulGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: true, tela: ContentView())
//}
