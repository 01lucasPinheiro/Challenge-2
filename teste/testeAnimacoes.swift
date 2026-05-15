//
//  testeAnimacoes.swift
//  teste
//
//  Created by Lucas on 15/05/26.
//

import SwiftUI

struct testeAnimacoes: View {
    let frames = ["imagem1", "imagem2","imagem3","imagem4","imagem5"]
    
    var body: some View {
        //usado para gerar imagens em sequencia
        PhaseAnimator(frames){ frame in
            
                Image(frame)
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
            //define o tipo de animacao
        } animation: { _ in
                .linear(duration: 0.4)
        }
    }
}

#Preview {
    testeAnimacoes()
}
