//
//  testeTermometro.swift
//  teste
//
//  Created by Lucas on 20/05/26.
//

import SwiftUI
import Observation

struct TermometroView: View {

    let temperatura: Double
    private let comprimento: CGFloat = 300
    private let espessura: CGFloat = 30
    private let marcacoes: [CGFloat] = [0.25, 0.5, 0.75]
    private let indicadores = ["Poluicao","Temperatura","Umidade"]
    var index: Int
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 16){
                Image("indicador\(indicadores[index])")
                    .scaleEffect(1)
            ZStack(alignment: .leading) {
                
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: comprimento, height: espessura)
                    
                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [.green, .yellow, .orange, .red],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: comprimento, height: espessura)
                        .mask(
                            HStack(spacing: 0) {
                                Rectangle()
                                    .frame(width: comprimento * temperatura)
                                Spacer(minLength: 0)
                            }
                        )
                    
                    // 3. Tracinhos de Marcação (1/8, 1/4, 1/2, etc.)
                    ForEach(marcacoes, id: \.self) { fracao in
                        Rectangle()
                            .fill(Color.white.opacity(0.6))
                            .frame(width: 2, height: espessura)
                            .offset(x: comprimento * fracao)
                        
                    }
                }
                .frame(width: comprimento, height: espessura)
            }
        }
    }
}

#Preview {
    TermometroView(temperatura: 0.2, index: 0)
}
