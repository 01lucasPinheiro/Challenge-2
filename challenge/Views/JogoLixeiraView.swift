//
//  JogoLixeiraView.swift
//  teste
//
//  Created by Lucas on 21/05/26.
//

import SwiftUI

struct JogoLixeiraView: View {
    @State private var viewModel = JogoLixeiraViewModel()
    
    var body: some View {
        VStack {
            Text("Sua pontuação é: \(viewModel.pontuacao)")
                .font(.headline)
            
            HStack(spacing: 50) {
                ForEach(0...4, id: \.self) { index in
                    Image(viewModel.nomeImagemLixeira(para: index))
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        viewModel.framesLixeiras[index] = geo.frame(in: .named("campoDoJogo"))
                                    }
                            }
                        )

                }
            }
            
            Spacer()
            
            HStack(spacing: 100) {
                ForEach(0..<5, id: \.self) { index in
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 40)
                        .overlay(Text("\(index)").foregroundColor(.white))
                        .offset(viewModel.posicao[index])
                        .gesture(
                            DragGesture(coordinateSpace: .named("campoDoJogo"))
                                .onChanged { value in
                                    viewModel.atualizarArrasto(index: index, translacao: value.translation, localizacao: value.location)
                                }
                                .onEnded { value in
                                    withAnimation {
                                        viewModel.finalizarArrasto(index: index, localizacao: value.location)
                                    }
                                }
                        )
                }
            }
        }
        .frame(maxWidth: 300, maxHeight: 300)
        .padding()
        .coordinateSpace(name: "campoDoJogo")
    }
}

#Preview {
    JogoLixeiraView()
}
