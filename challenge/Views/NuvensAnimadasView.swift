//
//  nuvensAnimadasView.swift
//  teste
//
//  Created by Lucas on 22/05/26.
//

import SwiftUI

struct NuvensAnimadasView: View {
    let quantidade: Int
    let geoWidth: CGFloat
    var brigthnessCloud: Double = 0
    
    
    private let offsetsX: [CGFloat] = [-550, 450, -50, -250, 320, 500, -420]
    private let offsetsY: [CGFloat] = [150, 120, 100, 140, 90, 120, 150]

    @State var mover = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ForEach(0..<min(quantidade, offsetsX.count), id: \.self) { index in
                Image("nuvem1")
                    .interpolation(.none)
                    .brightness(brigthnessCloud)
                    .scaleEffect(6.5)
                    .offset(x: offsetsX[index], y: offsetsY[index])
                    .transition(.opacity.combined(with: .scale))
              
            }
        }
        .frame(width: geoWidth, height: 200, alignment: .top)
        .animation(.easeInOut(duration: 0.3), value: quantidade)
        .padding()
        
       
            
    }
}
#Preview {
    NuvensAnimadasView(quantidade: 10, geoWidth: 1366)
}
