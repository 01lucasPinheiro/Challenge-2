//
//  JogoFabricaView.swift
//  Challenge
//
//  Created by Felipe Colares Cardoso on 25/05/26.
//

import SwiftUI
import Combine

struct JogoFabricaView: View {
    @State private var viewModel = JogoChuvaViewModel()
    var body: some View {
        GeometryReader { geometry in
            
            
            
            ZStack{
                
                
                Image("Prédio 2")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(x: -100, y: 130)
                Image("Prédio 1")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .offset(x: 150, y: 130)
                
                
                Image("usina")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 433, height: 282)
                    .offset(x: -230, y: 280)
                Image("usina")
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 433, height: 282)
                    .offset(x: -1100, y: 290)
                
                
                
                
                Image("Fábrica Expandida")
                    .interpolation(.none)
                    .resizable()
                    .resizable(resizingMode: .stretch)
                    .scaledToFit()
                    .offset(x: -600, y: 130)
                // .frame(width: geometry.size.width , height: geometry.size.height)
                
                
                Image("Cercado Expandido")
                    .interpolation(.none)
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
                    .padding(.bottom, 80)
                    .ignoresSafeArea()
                    .offset(x: -400, y: 130)
                ZStack{
                    Image("Placa")
                        .interpolation(.none)
                        .resizable()
                        //Scale(0.6)
                        .scaledToFit()
                        .frame(width: 800, height: 800)
                        .offset(x: -100, y: 230)
                    
                    ZStack{
                        Image(
                          
                    }
                    
                }
             
            }
            .frame(
                maxWidth: .infinity, maxHeight: .infinity
            )
            .background(Image("Céu Expandido"))
        }.scaledToFit()
        .edgesIgnoringSafeArea(.all)
    }
}


    #Preview {
        JogoFabricaView()
            //.previewInterfaceOrientation(.landscapeRight)
    }
