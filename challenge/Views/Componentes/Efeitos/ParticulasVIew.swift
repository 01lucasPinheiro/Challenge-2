//
//  FumacaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI
import Foundation
import Combine



struct ParticulasView: View {
    
    @State private var particulas: [efeitoParticulas] = []
    let timer = Timer.publish(every: .random(in: 0.1...0.9), on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: .random(in: 0.1...1.5), on: .main, in: .common).autoconnect()
    
    var ligada: Bool = true
    var intensidadeFumaca: Int = 1
    
    var body: some View {
        
        
                  
                        if ligada {
                            ZStack{
                             
                                
                                ForEach(particulas) { p in Particulas(estadoFumaca: intensidadeFumaca)
                                    // .position(x: 0, y: 400) // posição em x da primeira particula
                                }
                                ZStack{
                                    ForEach(particulas) { p in Particulas(estadoFumaca: intensidadeFumaca)
                                        //  .position(x: 0, y: 400) // posicao em x da segunda particula
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .onReceive(timer2) { _ in
                                    let x = CGFloat.random(in: 300 ..< 850)
                                    particulas.append(efeitoParticulas(x: x))
                                    if particulas.count > 21 { // limite de particulas em tela antes de eliminar
                                        particulas.removeFirst()
                                    }
                                }
                            }.scaleEffect(1.4)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            // .background(Color.black)
                                .onReceive(timer) { _ in
                                    let x = CGFloat.random(in: -550 ..< -300)
                                    particulas.append(efeitoParticulas(x: x))
                                    if particulas.count > 21 {// limite de particulas em tela antes de eliminar
                                        particulas.removeFirst()
                                    }
                                }.scaleEffect(1)
                                //.opacity(0.1)
                        }
                   
    }
}



// Anotaçõe de particulas animadas no arquivo Particulas
/*
 
 Efeito aberto 
withAnimation(.easeOut(duration: 13)){
    offsetY = -30
    offsetX = CGFloat.random(in: -360..<360) // este código permite distribuição horizontal da fumaça
     
    opacity = 0
    sizeParticle = 4
*/
 
 #Preview {
     ParticulasView()
 }
 
 
