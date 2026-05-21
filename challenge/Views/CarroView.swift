//
//  CarroView.swift
//  teste
//
//  Created by Lucas on 21/05/26.
//

import SwiftUI

struct CarroView: View {
    @State private var carro = CarroViewModel(carro: Carro(nome: "Fox", cor: "Azul"))
    @State private var novaCor: String = ""
    var body: some View {
        VStack{
            Text(carro.descricaoCarro)
            
            TextField("Qual a cor do carro", text: $novaCor)
            
            Button("Trocar a cor do carro"){
                carro.pintarCarroll(novaCor: novaCor)
            }
        }
        .padding()
    }
}

#Preview {
    CarroView()
}
