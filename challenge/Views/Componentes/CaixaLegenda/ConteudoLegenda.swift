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
        
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                HStack {
                    Image(systemName: legenda.icon)
                        .resizable()
                        .padding(12)
                }
                .frame(width: legenda.widthFrame, height: legenda.heightFrame)
                .foregroundColor(Color.botaoTexto)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .botaoAzul, location: 0.0),
                            Gradient.Stop(color: .azulGradiente, location: 3),
                            ],
                            
                        startPoint: .top,
                        endPoint: .bottom,
                    )
                )
                .cornerRadius(50)
                
                Text(legenda.textoLegenda)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.azulTexto)
            }
            
        }
    }
}


