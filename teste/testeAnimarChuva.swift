//
//  testeAnimarChuva.swift
//  teste
//
//  Created by Lucas on 14/05/26.
//

import SwiftUI
import Combine

struct testeAnimarChuva: View {
    @State private var segundaNuvemAtiva = false
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            // Imagem 1
            Image("chuva1")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
                .opacity(segundaNuvemAtiva ? 0 : 1)
            
            // Imagem 2
            Image("chuva2")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
                .opacity(segundaNuvemAtiva ? 1 : 0)        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                segundaNuvemAtiva.toggle()
            }
        }
    }
}

#Preview {
    testeAnimarChuva()
}
