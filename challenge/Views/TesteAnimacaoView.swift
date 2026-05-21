//
//  testeAnimacao.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//

import SwiftUI

struct TesteAnimacaoView: View {
        @State private var adjustBy = 100.0


        private var oneSecondAnimation: Animation {
           .easeInOut(duration: 1.0)
        }


        var body: some View {
            VStack(spacing: 40) {
                HStack(alignment: .bottom) {
                    Capsule()
                        .frame(width: 50, height: 175 - adjustBy)
                    Capsule()
                        .frame(width: 50, height: 175 + adjustBy)
                }
                .animation(oneSecondAnimation.speed(0.25), value: adjustBy)


                Button("Animate") {
                    adjustBy *= -1
                
            }
        }
    }

}

#Preview {
    TesteAnimacaoView()
}
