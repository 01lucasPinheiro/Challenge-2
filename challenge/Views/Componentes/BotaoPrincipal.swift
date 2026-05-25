//
//  BotaoPrincipal.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI
struct ButtonsComponent<Destino: View>: View {
    
    var showIcon: Bool = false
    var icon: String
    var buttonText: String
    var radius: CGFloat = 0
    var colorTextButton: Color
    var colorButton: Color
    var colorButtonGradient: Color
    var widthFrame: CGFloat = 0
    var heightFrame: CGFloat = 0
    var contornoBranco: Bool = false

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
                    if showIcon {
                        Image(systemName: icon)
                            .resizable()
                            .frame(width: 21, height:23)
                            .padding(.trailing, 10)
                            .padding(.bottom, 3)
                    }
                    Text(buttonText)
                        .font(.system(size: 18, weight: .bold)) // Peso da fonte aqui
                }
                .frame(width: widthFrame, height: heightFrame)
                .foregroundColor(colorTextButton)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: colorButton, location: 0.0),
                            Gradient.Stop(color: colorButtonGradient, location: 3),
                            ],
                            
                        startPoint: .top,
                        endPoint: .bottom,
                    )
                )
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
    ButtonsComponent(showIcon: false, icon: "arrow.forward", buttonText: "Iniciar", radius: 30, colorTextButton: .botaoTexto, colorButton: .botaoAzul, colorButtonGradient: .azulGradiente, widthFrame: 300, heightFrame: 50, contornoBranco: true, tela: ContentView())
}
