//
//  testeTela.swift
//  teste
//
//  Created by Lucas on 13/05/26.
//

import SwiftUI

struct testeTela: View {
    @State var corCirculo: Color = .red
    @State private var barra1 = 150.0
    @State private var barra2 = 100.0
    @State private var navegando: Bool = false
    @State private var estadoMapa = 0
    var mapa: String{
        switch estadoMapa{
        case 0...2:
            return "mapa"
        default:
            return "mapa2"
        }
    }


    
    
    private var oneSecondAnimation: Animation {
        .easeInOut(duration: 0.5)
    }
    var body: some View {
        NavigationStack {
            
            
            HStack {
                ZStack {
                    ScrollView([.horizontal, .vertical], showsIndicators: false) {
                        ZStack {
                            Image(mapa)
                                .frame (width: 1500, height: 1500)
                            
                            Circle()
                                .fill(corCirculo)
                                .frame(width: 50, height: 50)
                                .position(x: 740, y: 280)
                                .onTapGesture {
                                    corCirculo = .blue
                                    barra1 += 50
                                    barra2 -= 20
                                    navegando = true
                                    estadoMapa += 1
                                }
                            
                            
                            
                            
                        }
                    }.navigationDestination(isPresented: $navegando){
                        testemovimento()
                    }
                    HStack{
                        Spacer()
                        Rectangle()
                            .fill(Color.gray.opacity(0))
                            .frame(width: 50, height: 300)
                            .overlay(
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(height: barra1)
                                , alignment: .bottom
                            )
                            .animation(.easeInOut, value: barra1)
                        Rectangle()
                            .fill(Color.gray.opacity(0))
                            .frame(width: 50, height: 300)
                            .overlay(
                                Capsule()
                                    .fill(Color.orange)
                                    .frame(height: barra2)
                                , alignment: .bottom
                            )
                            .animation(.easeInOut, value: barra2)
                        
                        
                    }
                }
            }
        }
    }
    
}
#Preview {
    testeTela()
}
