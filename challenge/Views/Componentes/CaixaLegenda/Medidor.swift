//
//  Medidor.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI

struct Medidor: View {
    @State private var estado: Int = 1

    var anguloParaEstado: Double {
        switch estado {
        case 1: return -80
        case 2: return -35
        case 3: return 0
        case 4: return 35
        case 5: return 80
        default: return -80
        }
    }

    var body: some View {
        VStack(spacing: 60) {
            ZStack {
                PonteiroView(tremor: estado >= 4, angulo: anguloParaEstado)
            }
            .padding(.bottom, 0)
            .frame(width: 160, height: 160)

            HStack(spacing: 16) {
                Button(action: {
                    if estado > 1 {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                            estado -= 1
                        }
                    }
                }) {
                    Text("-")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .foregroundColor(.clear)
                        .frame(width: 75, height: 60)
                        .background(Color.botaoAzul)
                        .cornerRadius(10)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.botaoTexto, lineWidth: 2)
                                )
                }.padding(.leading, -100)
                    .padding(.bottom, -100)
                .disabled(estado <= 1)

                Button(action: {
                    if estado < 5 {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                            estado += 1
                        }
                    }
                }) {
                    Text("+")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .foregroundColor(.clear)
                        .frame(width: 75, height: 60)
                        .background(Color.botaoAzul)
                        .cornerRadius(10)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.botaoTexto, lineWidth: 2)
                                )
                }.padding(.leading, 70)
                    .padding(.bottom, -100)
                .disabled(estado >= 5)
            }.padding(.leading, 100)
                
        }
        .padding(40)
    }
}

// MARK: - Ponteiro

struct PonteiroView: View {
    let tremor: Bool
    let angulo: Double

    @State private var shakeOffset: Double = 0
    @State private var tremorAtivo: Bool = false

    var body: some View {
        Capsule()
            .fill(Color.primary)
            .frame(width: 8, height: 120)
            .offset(y: 0)
            .rotationEffect(
                .degrees(angulo + shakeOffset),
                anchor: .bottom
            )
            .offset(y: 45)
            .animation(.spring(response: 0.5, dampingFraction: 0.55), value: angulo)
            .onChange(of: tremor) { novoValor in
                tremorAtivo = novoValor
                if novoValor {
                    iniciarCicloTremor()
                } else {
                    shakeOffset = 0
                }
            }
    }

    func iniciarCicloTremor() {
        guard tremorAtivo else { return }
        let intensidade: Double = angulo >= 70 ? 4.5 : 2.5
        withAnimation(.easeInOut(duration: 0.08)) {
            shakeOffset = Double.random(in: -intensidade...intensidade)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.09) {
            iniciarCicloTremor()
        }
    }
}

#Preview {
    Medidor()
}
