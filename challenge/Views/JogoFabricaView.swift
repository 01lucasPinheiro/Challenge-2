//
//  JogoFabricaView.swift
//  teste
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
                Image("Céu")
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 1800, height: 1346)
                    .clipped()
                
                //JogoChuvaView(viewModel: self.$viewModel)
                ZStack{
                    Image("Fábrica")
                        .interpolation(.none)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 1619, height: 911)
                        .clipped()
                        .padding(.leading, -200)
                        .padding(.top, -180)
                    ZStack{
                        Image("Cercado")
                            .interpolation(.none)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .padding(.top, -300)
                    }
                        
                }
            }
        }.ignoresSafeArea()
    }
}


    #Preview {
        JogoFabricaView()
    }
