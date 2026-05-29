//
//  EfeitoFumacaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI


struct efeitoFumaca: Identifiable{
    let id = UUID()
    var x: CGFloat
  //  var scaleFinal: CGFloat =
}

struct EfeitoFumacaView: View {
    
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 0.8
    @State private var sizeParticle: CGFloat = CGFloat.random(in: 1.2..<2.5)
    @State private var offsetX: CGFloat = 0
    
   // @State private var aberturaFumaca: (x1: Int, x2: Int) = (0, 0)
    
    var body: some View {
        Image("ParticulaFumaca")
           // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
            .opacity(opacity)
            .offset(x: offsetX, y: offsetY)
            .scaleEffect(CGFloat(sizeParticle))
           // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
            .saturation(0.2)
            .onAppear {
                withAnimation(.easeOut(duration: 6)){
                    offsetY = -70
                    offsetX = CGFloat.random(in: -30..<30) // este código permite distribuição horizontal da fumaça
                     
                    opacity = 0
                    sizeParticle = 4
                }
            }
        
    }
}
/*
#Preview {
    EfeitoFumacaView()
}
*/
