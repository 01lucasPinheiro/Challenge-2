//
//  testeMudarMapa.swift
//  teste
//
//  Created by Lucas on 14/05/26.
//

import SwiftUI

struct testeMudarMapa: View {
    @State var corCirculo: Color = .red
    @State private var barra1 = 150.0
    @State private var barra2 = 100.0
    @State private var navegando: Bool = false
    //@State private var mapa = "mapa"
    @State private var estadoMapa = 0
    var mapa: String{
        switch estadoMapa{
        case 0...4:
            return "mapa"
        default:
            return "mapa2"
        }
    }
    var body: some View {
        ScrollView([.horizontal, .vertical], showsIndicators: false) {
            ZStack {
                Image(mapa)
                    .frame (width: 1500, height: 1500)
                
                Circle()
                    .fill(corCirculo)
                    .frame(width: 50, height: 50)
                    .position(x: 740, y: 280)
                    .onTapGesture {
                        corCirculo = .blue
                        barra1 += 50
                        barra2 -= 50
                        navegando = true
                        estadoMapa += 1
                    }
                
            }
        }
    }
}
    #Preview {
        testeMudarMapa()
        
    }
