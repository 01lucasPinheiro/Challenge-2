//
//  TelaMenuView.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 27/05/26.
//

import Foundation
import SwiftUI

struct TelaMenuView: View {
    
    @State private var navegando: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("FundoTelaMenu")
                    .resizable()
                    .interpolation(.none)
                    .ignoresSafeArea()
                
                VStack (spacing: 35){
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200, maxHeight: 200)
                    
                    
                        ButtonsComponent(
                            botao: BotaoPrincipalObjeto.ArrayBotoes[0])
                        {
                            navegando = true
                        }
                        .navigationDestination(isPresented: $navegando) {
                            testeTela()
                        }
                    
                    ButtonsComponent(
                        botao: BotaoPrincipalObjeto.ArrayBotoes[1])
                    {
                    }
                    ButtonsComponent(
                        botao: BotaoPrincipalObjeto.ArrayBotoes[2])
                    {
                    }
                    
                }
                .padding(60)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.regularMaterial)
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.caixasAzul.opacity(0.4))
                    }
                        .opacity(0.4)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.azulInterface.opacity(0.8), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.10), radius: 12, x: 0, y: 6)
                
                
                
            }
        }
        
    }
}

#Preview {
    TelaMenuView()
        .environment(DadosCidadeData())
}
