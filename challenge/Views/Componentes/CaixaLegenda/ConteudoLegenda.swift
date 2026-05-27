//
//  ConteudoLegenda.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 27/05/26.
//

import Foundation
import SwiftUI

struct ConteudoLegenda: View {
    
    let legenda: ConteudoLegendaClasse
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 2) {
            
            HStack {
                HStack {
                    Image(legenda.icon)
                        .resizable()
                        .padding(5)
                        .frame(width: 60, height: 60)
                }
                
                Text(legenda.textoLegenda)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.azulTexto)
            }
            
        }
    }
}


