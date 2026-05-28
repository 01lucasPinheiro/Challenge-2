//
//  EfeitoChuvaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 28/05/26.
//

import SwiftUI
import Foundation
import Combine

struct efeitoParticulasChuva: Identifiable{
    let id = UUID()
    var x: CGFloat
  //  var scaleFinal: CGFloat =
}

struct ParticulasChuva: View {
    
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 1
    @State private var sizeParticle: Int = 1
    @State private var offsetX: CGFloat = 0
    
   var chuvaForteParticula: Bool = false
    
  
    
    var body: some View {
        if chuvaForteParticula{
            Rectangle()
               // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
                .fill(Color.botaoAzul)
                .frame(width: 2, height: 6) // tamanho da gota
                .opacity(opacity)
                .offset(x: .random(in: -20..<20), y: offsetY)
                .scaleEffect(1)
               // .frame(width: , height: sizeParticle)
                //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.6)){
                        offsetY = 100
                        offsetX = CGFloat.random(in: 1..<10) // este código permite distribuição horizontal da fumaça
                         
                        opacity = 1
                        sizeParticle = 4
                    }
                }
        }
        else{
            Rectangle()
            // .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
                .fill(Color.blue)
                .frame(width: 2, height: 6) // tamanho da gota
                .opacity(opacity)
                .offset(x: .random(in: -20..<20), y: offsetY)
                .scaleEffect(1)
            // .frame(width: , height: sizeParticle)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
                .saturation(1)
                .onAppear {
                    withAnimation(.easeOut(duration: 1)){
                        offsetY = 100
                        offsetX = CGFloat.random(in: 1..<10) // este código permite distribuição horizontal da fumaça
                        
                        opacity = -0.02
                        sizeParticle = 4
                    }
                }
        }
    }
}

struct EfeitoChuvaView: View {
    
    @State private var particulas: [efeitoParticulasChuva] = []
    let timer = Timer.publish(every: .random(in: 0.1...0.9), on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: .random(in: 0.1...1.5), on: .main, in: .common).autoconnect()
    
    let timer3 = Timer.publish(every: .random(in: 0.5...1.8), on: .main, in: .common).autoconnect()
    
    var chuvaForte : Bool = true
    
    var body: some View {
        if chuvaForte {
            
            ZStack{
            ForEach(particulas) { p in ParticulasChuva(chuvaForteParticula: true)
                // .position(x: 0, y: 400) // posição em x da primeira particula
            }
            ZStack{
                ForEach(particulas) { p in ParticulasChuva(chuvaForteParticula: true)
                    //  .position(x: 0, y: 400) // posicao em x da segunda particula
                    
                }
                ZStack{
                    ForEach(particulas) { p in ParticulasChuva(chuvaForteParticula: true)
                        //  .position(x: 0, y: 400) // posicao em x da segunda particula
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onReceive(timer3) { _ in
                    let x = CGFloat.random(in: 0 ..< 100)
                    particulas.append(efeitoParticulasChuva(x: x))
                    if particulas.count > 5 { // limite de particulas em tela antes de eliminar
                        particulas.removeFirst()
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(timer2) { _ in
                let x = CGFloat.random(in: 0 ..< 100)
                particulas.append(efeitoParticulasChuva(x: x))
                if particulas.count > 5 { // limite de particulas em tela antes de eliminar
                    particulas.removeFirst()
                }
            }
        }.scaleEffect(1.4)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        // .background(Color.black)
            .onReceive(timer) { _ in
                let x = CGFloat.random(in: 0 ..< 100)
                particulas.append(efeitoParticulasChuva(x: x))
                if particulas.count > 5 {// limite de particulas em tela antes de eliminar
                    particulas.removeFirst()
                }
            }.scaleEffect(1)
            
            
        }else{
            
            ZStack{
            ForEach(particulas) { p in ParticulasChuva(chuvaForteParticula: false)
                // .position(x: 0, y: 400) // posição em x da primeira particula
            }
            ZStack{
                ForEach(particulas) { p in ParticulasChuva(chuvaForteParticula: false)
                    //  .position(x: 0, y: 400) // posicao em x da segunda particula
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onReceive(timer2) { _ in
                let x = CGFloat.random(in: 0 ..< 100)
                particulas.append(efeitoParticulasChuva(x: x))
                if particulas.count > 6 { // limite de particulas em tela antes de eliminar
                    particulas.removeFirst()
                }
            }
        }.scaleEffect(1.4)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        // .background(Color.black)
            .onReceive(timer) { _ in
                let x = CGFloat.random(in: 0 ..< 100)
                particulas.append(efeitoParticulasChuva(x: x))
                if particulas.count > 6 {// limite de particulas em tela antes de eliminar
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
     EfeitoChuvaView()
 }
 
 
