//
//  Legenda.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI
struct Legenda: View {
    var body: some View {
        VStack {
            Text("Legenda")
            
            HStack {
                IconAreas(icon: "cloud.fill", radius: 60, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, widthFrame: 50, heightFrame: 50, contornoBranco: true, padding: 10, tela: ContentView())
                Text("Emissão de Poluentes")
                
                Spacer()
            }
            HStack {
                IconAreas(icon: "cloud.fill", radius: 60, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, widthFrame: 50, heightFrame: 50, contornoBranco: true, padding: 10, tela: ContentView())
                Text("Chuva")
                
                Spacer()

            }
            HStack {
                IconAreas(icon: "cloud.fill", radius: 60, corTextoBotao: .botaoTexto, corBotao: .botaoAzul, widthFrame: 50, heightFrame: 50, contornoBranco: true, padding: 10, tela: ContentView())
                Text("Reciclagem")
                
                Spacer()

            }
            
        }
        .background(Color.caixasAzul)
        
    }
}
#Preview {
Legenda()
}
