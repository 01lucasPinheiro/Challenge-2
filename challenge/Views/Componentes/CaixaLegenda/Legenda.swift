//
//  Legenda.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI
struct Legenda<Content: View>: View { //content aceita algum elemento visual do SwiftUI
    let caixa: LegendaClasse
    let conteudo: Content
    
    init(caixa: LegendaClasse, @ViewBuilder conteudo: () -> Content) { //viewBuilder permite várias views dentro do conteudo
        self.caixa = caixa
        self.conteudo = conteudo()
    }
    
    var body: some View {
        VStack(spacing: 12) {
                Text(caixa.titulo)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(Color.azulTexto)

                conteudo
            }
            .padding(20)
            .frame(width: caixa.widthMax)
            .background(
                RoundedRectangle(cornerRadius: caixa.radius)
                    .fill(Color.caixasAzul.opacity(0.5))
            )
            .overlay(
                RoundedRectangle(cornerRadius: caixa.radius)
                    .stroke(Color.azulInterface, lineWidth: 1)
            )
    }
}

//COMO CHAMAR
//
//#Preview {
//    Legenda(caixa: LegendaObjeto.arrayCaixas[0]) {
//        VStack(alignment: .leading, spacing: 12) {
//            
//            ConteudoLegenda(
//                legenda: ConteudoLegendaObjeto.ArrayLegenda[0])
//            ConteudoLegenda(
//                legenda: ConteudoLegendaObjeto.ArrayLegenda[1])
//           ConteudoLegenda(
//               legenda: ConteudoLegendaObjeto.ArrayLegenda[2])
//
//
//           }
//        }
//   }
