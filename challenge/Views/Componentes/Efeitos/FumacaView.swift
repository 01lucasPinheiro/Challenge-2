//
//  FumacaView.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 27/05/26.
//

import SwiftUI
import Foundation
import Combine



struct FumacaView: View {
    
    @State private var particulas: [efeitoFumaca] = []
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
        
        
    
    var body: some View {
       
        ZStack{
            ForEach(particulas) { p in EfeitoFumacaView()
                    .position(x: 0, y: 400)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onReceive(timer) { _ in
            let x = CGFloat.random(in: 10..<60)
            particulas.append(efeitoFumaca(x: x))
            if particulas.count > 51 {
                particulas.removeFirst()
            }
        }
        
    }
}

#Preview {
    FumacaView()
}


/*
 
 
 
 */
