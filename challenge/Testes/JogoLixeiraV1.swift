//
//  testemovimento.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//

import SwiftUI

struct JogoLixeiraV1: View {
    @State private var alvos: [CGSize] = Array(repeating: .zero, count: 5)
    @State private var foiAcertado: [Bool] = Array(repeating: false, count: 5)
    let corAlvos: [Color] = [.blue, .red, .yellow, .green, .purple]
    let lixeiras = ["lixeira1","lixeira2","lixeira3","lixeira4","lixeira5"]
    
    
    var body: some View {
        VStack(spacing:150){
            
            HStack(spacing: 40){
                ForEach(lixeiras, id: \.self) { lixeira in
                    Image(lixeira)
                }
                //antigos circulos
//                ForEach(0..<5){ index in
//                    Circle()
//                    //.fill(corAlvos[index])
//                        .stroke(corAlvos[index], lineWidth: 4)
//                        .frame(width: 60, height: 60)
//                        .overlay(
//                            Image(systemName: "acerto")
//                                .font(.title2)
//                                .bold()
//                                .foregroundColor(corAlvos[index])
//                        )
//                    
//                }
            }
            .padding(.top,20)
            
            //        Circle()
            //            .fill(Color.red)
            //            .frame(width: 60, height: 60)
            //            .position(posicao)
            //            .gesture(
            //                DragGesture() //reconhece quando o usuario clica e arrasta o circulo
            //                    .onChanged { value in //faz a logica de ir mudando a posicão o .onCganged e um metodo que recebe uma closure como argumento
            //                        self.posicao = value.location
            //                    }
            //            )
            HStack(spacing: 100){
        
                    ForEach(0..<5){ index in
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(corAlvos[index])
                        .offset(alvos[index])
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if !foiAcertado[index] {
                                        alvos[index] = value.translation
                                        print(value.translation)
                                    }
                                }
                                .onEnded { value in
                                    if value.translation.height < -500 && abs(value.translation.width) < 50 &&
                                    value.translation.height > -650{
                                        withAnimation {
                                            foiAcertado[index] = true
                                        }
                                    } else {
                                        withAnimation(.spring()) {
                                            alvos[index] = .zero
                                        }
                                    }
                                }
                            
                            
                        )
                        .opacity(foiAcertado[index] ? 0.5 : 1)
                }
                                
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        
    }
}

#Preview {
    JogoLixeiraV1()
}
