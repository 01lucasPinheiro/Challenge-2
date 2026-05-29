//
//  IconesMapa.swift
//  teste
//
//  Created by Felipe Colares Cardoso on 26/05/26.
//


import SwiftUI

struct IconesMapa: View {
    let imagens = ["fabricaIcone", "nuvemIcone", "reciclagemIcone"]
    
    @State private var index = 0
    
    var body: some View {
        
        Button {

                    index = (index + 1) % imagens.count

                } label: {

                    Image("elipseIcone")
                        //.fill(Color.green.opacity(0.2))
                        .frame(width: 120, height: 70)
                        .overlay {

                            Image(imagens[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                        }
                }
}
}
#Preview {
    IconesMapa()
}
