//
//  testeAreaClique.swift
//  teste
//
//  Created by Lucas on 14/05/26.
//

import SwiftUI

struct testeAreaClique: View {
    @State private var clique: Bool = false
    var body: some View {
        HStack {
            Text("teste")
            Spacer()
            Text("teste")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .onTapGesture {apGesture in
            print("regiao clicada")
            clique = false
        }
        Spacer()
        HStack{
            Text("Area nao clicavel")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    testeAreaClique()
}
