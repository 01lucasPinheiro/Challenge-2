//
//  simulacaoChuva.swift
//  teste
//
//  Created by Lucas on 20/05/26.
//

import SwiftUI

struct simulacaoChuvaView: View {
    var body: some View {
        CloudView()
    }
}


struct CloudView: View {
    var body: some View {
        ZStack {
            // Base da nuvem (corpo principal)
            Capsule()
                .frame(width: 120, height: 50)
            
            // Círculo superior esquerdo
            Circle()
                .frame(width: 50, height: 50)
                .offset(x: -30, y: -10)
            
            // Círculo superior direito
            Circle()
                .frame(width: 60, height: 60)
                .offset(x: 20, y: -15)
            
            // Círculo central superior (opcional para dar mais volume)
            Circle()
                .frame(width: 40, height: 40)
                .offset(x: -5, y: -20)
        }
        .foregroundColor(.gray)
    }
}

struct NuvemMovimentoView: View {
    @State private var moveCloud = false
    @State private var moveCloud2 = false

    var body: some View {
        ZStack {
            // Fundo para contraste
            Color.blue.ignoresSafeArea()
            
            // Nuvem com animação
            ZStack {
                Image("nuvem 1")
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
            }
            .foregroundColor(.white.opacity(0.5))
            .offset(x: moveCloud ? -200 : 200, y: -100)
            .animation(
                Animation.linear(duration: 28)
                    .repeatForever(autoreverses: false),
                value: moveCloud
            )
            .onAppear {
                moveCloud.toggle()
            }
        }
    }
}



#Preview {
    NuvemMovimentoView()
}

