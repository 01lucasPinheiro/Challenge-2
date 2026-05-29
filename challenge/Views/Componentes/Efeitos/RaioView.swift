//
//  EfeitoFumacaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI




struct RaioView: View {
    
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 0.8
    @State private var sizeParticle: CGFloat = CGFloat.random(in: 1.2..<2.5)
    @State private var offsetX: CGFloat = 0
    @State private var valoresRaio: [Float] = [1, 1, 1, 1, 1, 1, 0.2]
    @State private var brilho: Double = -0.2
   // @State private var aberturaFumaca: (x1: Int, x2: Int) = (0, 0)
    
    var body: some View {
        Image("nuvemc2")
           // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
            .opacity(1)
            .offset(x: offsetX, y: offsetY)
            .brightness(brilho)
            .scaleEffect(4)
           // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
            //.saturation(0.2)
            .onAppear {
                            animarRaio()
                        }
        
    }
    func animarRaio() {
        let intervalo = Double.random(in: 3...7)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + intervalo) {
            // primeiro flash
            brilho = Double(valoresRaio.randomElement() ?? 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                brilho = -0.2
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                    // segundo flash
                    brilho = Double(valoresRaio.randomElement() ?? 0)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) {
                        brilho = -0.2
                        animarRaio() // loop
                    }
                }
            }
        }
    }
    
}

#Preview {
    RaioView()
}

