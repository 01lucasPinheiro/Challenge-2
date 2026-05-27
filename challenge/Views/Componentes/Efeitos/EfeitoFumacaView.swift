//
//  EfeitoFumacaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI


struct efeitoFumaca: Identifiable{
    let id = UUID()
    var x: CGFloat
}

struct EfeitoFumacaView: View {
    
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 1
    
    var body: some View {
        Image("nuvem cinza 1")
            .rotationEffect(.degrees([90, 180.0].randomElement() ?? 0.0))
            .opacity(opacity)
            .offset(y: offsetY)
            //.rotationEffect(.degrees([0.0, 180.0].randomElement() ?? 0.0))
            .saturation(0.6)
            .onAppear {
                withAnimation(.easeOut(duration: 2.5)){
                    offsetY = -120
                    opacity = 0
                }
            }
        
    }
}
/*
#Preview {
    EfeitoFumacaView()
}
*/
