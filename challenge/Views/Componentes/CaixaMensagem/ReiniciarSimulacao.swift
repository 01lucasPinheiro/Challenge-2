//
//  ReiniciarSimulação.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 26/05/26.
//

import Foundation
import SwiftUI
struct ReiniciarSimulacao: View {
    let mensagemTela: ReiniciarSimulacaoClasse
    
    var body: some View {
        GeometryReader{ geometry in
            
            RoundedRectangle(cornerRadius: 20)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.caixasAzul.opacity(0.5))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.azulInterface, lineWidth: 1)
                )
                .frame(maxWidth: mensagemTela.widthMax, maxHeight: mensagemTela.heightMax)
                .overlay (
                    VStack{
                        
                        Spacer()
                        
                        Image(systemName: mensagemTela.icon)
                            .font(.system(size: mensagemTela.tamanhoIcon, weight: .bold))
                            .foregroundStyle(
                                    LinearGradient(
                                        colors: [mensagemTela.gradienteUm, mensagemTela.gradienteDois, mensagemTela.gradienteTres, mensagemTela.gradienteQuatro],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                        
                        Text(mensagemTela.tituloMensagem)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(Color.botaoTexto)
                            .padding()
                        
                        Text(mensagemTela.mensagem)
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(Color.botaoTexto)
                            .padding()
                            .lineSpacing(10)
                        
                        
                        Spacer()
                        
                        HStack{
                            
                            Spacer()
                            
                            if mensagemTela.mensagemInformativa {
                                ButtonsComponent(
                                    botao: BotaoPrincipalObjeto.ArrayBotoes[8],
                                    tela: ContentView()
                                )
                            }
                             
                                else {
                                    ButtonsComponent(
                                        botao: BotaoPrincipalObjeto.ArrayBotoes[10],
                                        tela: ContentView()
                                    )
                                    
                                Spacer()
                                    ButtonsComponent(
                                        botao: BotaoPrincipalObjeto.ArrayBotoes[11],
                                        tela: ContentView()
                                )
                            }
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                        
                    },
                    alignment: .top
                    
                )
                .padding(30)
                .foregroundColor(.clear)
                .position(x: geometry.size.width / 2, y: geometry.size.width / 2)
        }
    }
}
