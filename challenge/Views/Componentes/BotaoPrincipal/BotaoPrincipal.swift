//
//  BotaoPrincipal.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI

//CÓDIGO PARA RETIRAR O BRANCO TRANSPARENTE DO REDOR DO BOTÃO

struct RoundedButtonStyle: ButtonStyle {
    let radius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0) // efeito
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0) // encolhimento
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

//CÓDIGO BOTÃO PRINCIPAL

struct ButtonsComponent: View {
    
    let botao: BotaoPrincipalClasse
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                if botao.contornoBranco {
                    RoundedRectangle(cornerRadius: botao.radius)
                        .stroke(Color.white, lineWidth: 4)
                        .frame(width: botao.widthFrame, height: botao.heightFrame)
                    //  .background(Color.white)
                    // .cornerRadius(botao.radius)
                    
                }
                HStack {
                    if botao.mostrarIcon {
                        Image(systemName: botao.icon)
                            .resizable()
                            .padding(20)
                    }
                    
                    if botao.mostrarTexto {
                        Text(botao.textoBotao)
                            .font(.system(size: 24, weight: .bold))
                    }
                }
                .frame(width: botao.widthFrame, height: botao.heightFrame)
                .foregroundColor(botao.corTextoBotao)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: botao.corBotao, location: 0.0),
                            Gradient.Stop(color: botao.corBotaoGradiente, location: 2.5),
                        ],
                        
                        startPoint: .top,
                        endPoint: .bottom,
                    )
                )
                .cornerRadius(botao.radius)
            }
            .contentShape(RoundedRectangle(cornerRadius: botao.radius))
        }
        .buttonStyle(RoundedButtonStyle(radius: botao.radius))
    }
}
            

