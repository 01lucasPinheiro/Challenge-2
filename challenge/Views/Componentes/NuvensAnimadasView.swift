//
//  nuvensAnimadasView.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI

struct NuvensAnimadasView: View {
    let distancia: CGFloat = -400
    @State var mover = false
    var body: some View {
        HStack {
            
            Image("nuvens")
            //movimentacao para o eixo x y continua constante
                .offset(x: mover ? distancia : 800, y: 0  )
                .animation(
                    .linear(duration: 20)
                    .repeatForever(autoreverses: false),
                    value: mover
                )
            Spacer()
                            
        }.frame(width: 1500, height: 1366)
            .onAppear {
                mover = true
            }
    }
}


#Preview {
    NuvensAnimadasView()
}
