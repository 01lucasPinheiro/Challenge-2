//
//  JogoLixeiraView.swift
//  teste
//
//  Created by Lucas on 21/05/26.
//

import SwiftUI

struct JogoLixeiraView: View {
    @Environment(DadosCidadeData.self) var cidadeData
    @State private var viewModel = JogoLixeiraViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image("CenarioJogoLixeira")
                .resizable()
                .interpolation(.none)
                .ignoresSafeArea()
                        
            //Spacer()
            VStack{

                HStack(spacing: 50) {
                    ForEach(0...4, id: \.self) { index in
                        lixeiraView(imagem: viewModel.nomeImagemLixeira(para: index), index: index)
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
                
                
                HStack(spacing: 100) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(viewModel.residuosParaJogar[index].nomeImagem)
                            .scaleEffect(0.5)

                            .offset(viewModel.posicao[index])
                        
                            .opacity(viewModel.circulosVisiveis[index] ? 1.0 : 0.0)
                            .disabled(!viewModel.circulosVisiveis[index])
                        
                            .gesture(
                                DragGesture(coordinateSpace: .named("campoDoJogo"))
                                    .onChanged { value in
                                        viewModel.atualizarArrasto(index: index, translacao: value.translation, localizacao: value.location)
                                    }
                                    .onEnded { value in
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            viewModel.finalizarArrasto(
                                                index: index,
                                                localizacao: value.location,
                                                cidadeData: cidadeData
                                            )
                                        }
                                    }
                            )
                    }
                }.frame(maxWidth: 300, maxHeight: 300)
                
            }
            .padding()
            .coordinateSpace(name: "campoDoJogo")
            VStack{
                CaixaDeTexto(index: 2)
                Spacer()
            }.padding(100)
        }
        
    }
}

#Preview {
    JogoLixeiraView()
        .environment(DadosCidadeData()) //precisamos do enviromente aqui para nao gerar erro
}
