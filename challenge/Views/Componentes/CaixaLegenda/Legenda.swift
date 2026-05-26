//
//  Legenda.swift
//  teste
//
//  Created by Maria Clara Fernandes Bessa on 25/05/26.
//

import Foundation
import SwiftUI
struct Legenda: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(maxWidth: 360, maxHeight: 230)
                .foregroundColor(.clear)
                .blur(radius: 10)
                .opacity(0.5)
                .background(Color.caixasAzul)
                .overlay (
                    Text("Legenda")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(Color.azulTexto)
                        .padding() ,
                    alignment: .top
                )
      
        }
        .foregroundColor(.clear)
        .background(Color.caixasAzul)
        
        
    }
}
#Preview {
Legenda()
}
