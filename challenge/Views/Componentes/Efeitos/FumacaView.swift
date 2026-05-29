//
//  FumacaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI
import Foundation
import Combine



struct FumacaView: View {
    
    @State private var particulas: [efeitoFumaca] = []
    let timer = Timer.publish(every: .random(in: 0.1...0.9), on: .main, in: .common).autoconnect()
    
    
    let timer2 = Timer.publish(every: .random(in: 0.1...1.5), on: .main, in: .common).autoconnect()
    
    var ligada: Bool = true
    
    var body: some View {
        
        
        ZStack{
            Image("Chamine usina")
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .offset(y: 400)
                .background(
                    GeometryReader { geo in
                        
                        if ligada {
                           
                            ZStack{
                                ForEach(particulas) { p in EfeitoFumacaView()
                                    // .position(x: 0, y: 400) // posição em x da primeira particula
                                }
                                ZStack{
                                    ForEach(particulas) { p in EfeitoFumacaView()
                                        //  .position(x: 0, y: 400) // posicao em x da segunda particula
                                        
                                        
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                //  .background(Color.black)
                                .onReceive(timer2) { _ in
                                    let x = CGFloat.random(in: -100 ..< 250)
                                    particulas.append(efeitoFumaca(x: x))
                                    if particulas.count > 51 {
                                        particulas.removeFirst()
                                    }
                                }
                            }.scaleEffect(1.4)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            // .background(Color.black)
                                .onReceive(timer) { _ in
                                    let x = CGFloat.random(in: -350 ..< -100)
                                    particulas.append(efeitoFumaca(x: x))
                                    if particulas.count > 51 {
                                        particulas.removeFirst()
                                    }
                                }.scaleEffect(1)
                        }
                    }
                ).scaleEffect(0.5)
                
        }
    }
}





 
 #Preview {
     FumacaView()
 }
 
 
