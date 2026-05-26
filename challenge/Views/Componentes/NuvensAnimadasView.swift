//
//  nuvensAnimadasView.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI

struct NuvensAnimadasView: View {
    let quantidade: Int
    private let posicoes: [CGPoint] = [
        CGPoint(x: -420, y: -350),
        CGPoint(x: 450, y: -350),
        CGPoint(x: 0, y: -350),
        CGPoint(x: -250, y: -390),
        CGPoint(x: 320, y: -390),
        CGPoint(x: 500, y: -390),
        CGPoint(x: -600, y: -390)

    ]
    //let distancia: CGFloat = -400
    @State var mover = false
    var body: some View {
        ZStack {
           
            ForEach(0..<min(quantidade, posicoes.count), id: \.self) { index in
                Image("nuvem1")
                    .interpolation(.none)
                    .scaleEffect(6)
                    .offset(x: posicoes[index].x, y: posicoes[index].y)
                    .transition(.opacity.combined(with: .scale))
            }
        }
        .frame(width: 1500, height: 1366)
        .animation(.easeInOut(duration: 0.3), value: quantidade)
    }
}


#Preview {
    NuvensAnimadasView(quantidade: 10)
}
