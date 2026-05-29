//
//  Particulas.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 28/05/26.
//

import SwiftUI


struct efeitoParticulas: Identifiable{
    let id = UUID()
    var x: CGFloat
  //  var scaleFinal: CGFloat =
}

struct Particulas: View {
    
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 0.2
    @State private var sizeParticle: CGFloat = CGFloat.random(in: 1.2..<2.5)
    @State private var offsetX: CGFloat = 0
    
    
    var estadoFumaca: Int = 1// de 0 a 5
    
    
    var body: some View {
        
        switch estadoFumaca {
        case 0:
            Image("ParticulaFumaca")
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
                .opacity(0)
                .offset(x: offsetX, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle))
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 8)){
                        offsetY = -50
                        offsetX = CGFloat.random(in: -60..<60) // este código permite distribuição horizontal da fumaça
                        
                        opacity = 0
                        sizeParticle = 4
                    }
                }
            
            
        case 1:
            Image("ParticulaFumaca")
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
                .opacity(0.2)
                .offset(x: offsetX, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle))
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 12)){
                        offsetY = -30
                        offsetX = CGFloat.random(in: -60..<60) // este código permite distribuição horizontal da fumaça
                        
                        opacity = -2
                        sizeParticle = 3
                    }
                }
        case 2:
            Image("ParticulaFumaca")
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
                .opacity(0.1)
                .offset(x: offsetX, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle))
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 26)){
                        offsetY = -40
                        offsetX = CGFloat.random(in: -160..<160) // este código permite distribuição horizontal da fumaça
                        
                        opacity = -2
                        sizeParticle = 4
                    }
                }
        case 3:
            Image("ParticulaFumaca")
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
                .opacity(0.1)
                .offset(x: offsetX, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle))
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 26)){
                        offsetY = -50
                        offsetX = CGFloat.random(in: -160..<160) // este código permite distribuição horizontal da fumaça
                        
                        opacity = -2
                        sizeParticle = 5
                    }
                }
        case 4:
            Image("ParticulaFumaca")
                .opacity(0.1) // opacidade da imagem quase transparente
                .offset(x: offsetX, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle)) // escala variável
                .saturation(1) // satruação
                .onAppear {
                    withAnimation(.easeOut(duration: 33)){ // duração
                        offsetY = -30 // altura que a particula alcança
                        offsetX = CGFloat.random(in: -360..<360) // este código permite distribuição horizontal da fumaça
                        opacity = 0 // opacidade final
                        sizeParticle = 4 // tamanho final
                    }
                }
            /* %
             withAnimation(.easeOut(duration: 13)){
                 offsetY = -30
                 offsetX = CGFloat.random(in: -360..<360) // este código permite distribuição horizontal da fumaça
                  
                 opacity = 0
                 sizeParticle = 4
             */
            Image("ParticulaFumaca")
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
                .opacity(0.1)
                .offset(x: 300, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle))
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 26)){
                        offsetY = -50
                        offsetX = CGFloat.random(in: -260..<260) // este código permite distribuição horizontal da fumaça
                        
                        opacity = -2
                        sizeParticle = 8
                    }
                }
            
        default:
            Image("ParticulaFumaca")
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            //.fill(Color.gray)
                .opacity(0.2)
                .offset(x: offsetX, y: offsetY)
                .scaleEffect(CGFloat(sizeParticle))
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 12)){
                        offsetY = -30
                        offsetX = CGFloat.random(in: -60..<60) // este código permite distribuição horizontal da fumaça
                        
                        opacity = -2
                        sizeParticle = 3
                    }
                }
            
        }
    }}



