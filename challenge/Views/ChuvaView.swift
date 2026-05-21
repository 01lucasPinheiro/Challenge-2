//
//  testedaChuva.swift
//  teste
//
//  Created by Lucas on 20/05/26.
//

import SwiftUI

struct ChuvaParticulas: View {
    @State private var iniciarAnimacao = false

    let xPosition: CGFloat
    let alturaTela: CGFloat
    let duration: Double
    var body: some View {

        Capsule()
            .fill(Color.blue)
            .frame(width: 1.5, height: CGFloat.random(in: 25...40))
            .rotationEffect(.degrees(8))
            .position(x: xPosition, y: iniciarAnimacao ? alturaTela + 50 : -50)
            .onAppear {
                withAnimation(
                    Animation
                        .linear(duration: duration)
                        .repeatForever(autoreverses: false)
                        .delay(Double.random(in: 2...5))
                ) {

                    iniciarAnimacao = true
                }
            }
        }
}

struct testedaChuva: View {
    var intensidadeChuva = 1000
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                
                ForEach(0..<intensidadeChuva, id: \.self) { index in
                    ChuvaParticulas(
                        xPosition: CGFloat.random(in: 500...geometry.size.width),
                        alturaTela: geometry.size.height,
                        duration: Double.random(in: 0.6...2),
                    )
                }
            }
        }
    }
}

#Preview {
    testedaChuva()
}
