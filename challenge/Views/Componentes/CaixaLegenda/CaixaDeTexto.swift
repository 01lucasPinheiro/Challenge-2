//
//  CaixaDeTexto.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI

struct CaixaDeTexto: View {
    @State private var mensagemVisivel = true
    let mensagem = ["A vida do ecossistema depende do seu ritmo. Ajuste o nível da chuva e clique em Visualizar efeito para testemunhar o impacto real de cada gota."," Controle livremente a quantidade de produtos fabricados pela indústria e veja seu impacto no ecossistema. Ao terminar sua exploração, veja o resultado clicando em Visualizar Efeito", "A escolha é sua: descartar ou acumular? Defina o destino na tela e toque em Visualizar efeito para testemunhar o impacto real no ecossistema."]
    
    @State private var index = 0
    
    
    
    var body: some View {
        
        if mensagemVisivel {
            
            
            ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 1079, height: 127)
                    .background(Color.botaoTexto.opacity(0.7))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.08, green: 0.29, blue: 0.53), lineWidth: 1)
                        
                    )
                Text(mensagem[0])
                    .font(
                    Font.custom("Poppins", size: 20)
                    .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.azulTexto)

                    .frame(width: 655, height: 70, alignment: .center)
                    .padding(.leading, -80)
                    
                Button {
                    mensagemVisivel  = false
                    print("Custom text button tapped")
                } label: {
                    Text("Entendido")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .foregroundColor(.clear)
                        .frame(width: 120, height: 70)
                        .background(Color.botaoVerde)
                        .cornerRadius(10)
                        .padding(.leading, 890)
                       
                }
                
            }//.position(x: geometry.size.width / 2 + 340, y: geometry.size.width / 2 + 150 )
        }
    }
}

#Preview {
    CaixaDeTexto()
}
