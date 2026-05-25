//
//  ContentView.swift
//  teste
//
//  Created by Lucas on 12/05/26.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        JogoFabricaView()

    }
    //    @State private var meucarro = Carro()
    //    @State private var novoNome : String = ""
    //    var body: some View {
    //        VStack {
    //            //imprimimos na tela o nome e cor do carro
    //            Text("Nome do carro: \(meucarro.nome) e cor \(meucarro.cor)")
    //        }
    //        .padding()
    //        //e possivel atualizar o nome do carro e o observable avisa a view que o valor mudou e ja atualiza a tela
    //        TextField("nome do carro", text: $novoNome)
    //            .padding()
    //        Button("mudar nome") {
    //            meucarro.nome = novoNome
    //        }
    //    }
}


#Preview {
    ContentView()
    
}
