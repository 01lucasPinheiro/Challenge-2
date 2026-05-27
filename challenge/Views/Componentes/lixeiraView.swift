//
//  lixeira.swift
//  teste
//
//  Created by Lucas on 26/05/26.
//

import SwiftUI

struct lixeiraView: View {
    let imagem: String
    let index: Int
    let tiposLixeiras: [String] = ["Metal", "Vidro", "Papel", "Plástico", "Orgânico"]
    
    var body: some View {
        ZStack(alignment: .center){
            Image(imagem)
                .resizable()



            
            VStack(alignment: .center,spacing: 2) {
                Text(tiposLixeiras[index])
                    .bold(true)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 14))
                Color.white
                    .frame(height: 5)
                    .opacity(0)
            }
        }
        .frame(width: 170, height: 250)
    }
}
#Preview {
    lixeiraView(imagem: "lixeiraAberta", index: 4)
}
